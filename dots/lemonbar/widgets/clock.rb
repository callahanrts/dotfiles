
class Clock

  def initialize(config)
    @config = config
    @time = get_time
  end

  def monitor
    loop do
      @time = get_time
      yield
      sleep 1
    end
  end

  def to_s
    @time
  end

private

  def get_time
    Time.now.strftime(@config.format)
  end

end

if __FILE__ == $PROGRAM_NAME
  clock = Clock.new
  clock.monitor { puts clock }
end
