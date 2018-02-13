
require 'usagewatch'

class Usage

  def initialize(config)
    @config = config
    @cpu = cpuload
    @temp = cputemp
  end

  def monitor
    loop do
      @cpu = cpuload
      @temp = cputemp
      yield
      sleep 1
    end
  end

  def to_s
    "%{B#373d48}  CPU: #{@cpu}%  #{@temp}°  %{B#282c34}    "
  end

private

  def cpuload
    cpu = Usagewatch.uw_cpuused.round
    cpu < 10 ? " #{cpu}" : cpu
  end

  def cputemp
    temps = core_temps.gsub(/\([^()]*\)/, "").scan(/\d{2}/)
    (temps.inject{ |sum, n| Integer(sum) + Integer(n) }.to_f / temps.size).round
  end

  def core_temps
    `sensors | grep Core`
  end

  def memused
    Usagewatch.uw_memused
  end

end

if __FILE__ == $PROGRAM_NAME
  cpu = Usage.new({})
  cpu.monitor { puts cpu }
end



