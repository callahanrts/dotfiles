Thread.abort_on_exception = true

require_relative 'config'

# Require widgets/ directory
Dir["widgets/*.rb"].each{ |file| require_relative file }

trap("SIGINT") { exit 0 } # Allow ctrl-c

class Lemonbar

  def initialize
    @config = BarConfig.new
    @bar = open(@config.bar_command, 'w+')
    @elements = parse_elements @config.format
  end

  def run
    @elements.each do |widget|
      # Ignore formatting strings when updating widgets
      Thread.new { widget.monitor { update! } } unless widget.is_a?(String)
    end

    Thread.new { @bar.each_line { |n| system n } }
    sleep
  rescue Interrupt
    close!
  end

private

  def parse_elements(format)
    # Replace first pipe with 'center' and the second with 'right'
    format.sub("|", "%{c}").sub("|", "%{r}").split(" ").map do |el|
      unless el.include?("%")
        # Create the widget if the element is a widget
        Object.const_get(el.to_s.capitalize).new(@config.get(el) || {})
      else
        el # Display formatting sring
      end
    end
  end

  def update!
    @bar.puts @elements.map{ |w| w.to_s }.join
  rescue KeyError
    raise "The bars format is malformed!"
  end

  def close!
    puts 'Exiting gracefully...'
    Process.kill('TERM', @bar.pid)
    exit
  end

end

Lemonbar.new.run

