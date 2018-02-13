
class Battery

  def initialize(config)
    @config = config
    @battery = ""
 end

  def monitor
    loop do
      @battery = get_battery
      yield
      sleep 5
    end
  end

  def to_s
    @battery
  end

private

  def get_battery
    bat = battery_level
    "#{icon(bat)} #{bat}%    "
  end

  def battery_level
    `echo $(acpi --battery | cut -d, -f2)`.sub("%", "").to_i
  end

  def icon bat
    case
      when bat > 90 then "\uf240"
      when bat > 75 then "\uf241"
      when bat > 50 then "\uf242"
      when bat > 25 then "\uf243"
      else "\uf244"
    end
  end

end

