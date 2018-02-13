
class Volume

  def initialize(config)
    @config = config
    @volume = get_volume
    @icon = icon(@volume)
  end

  def monitor
    loop do
      @volume = get_volume
      @icon = icon(@volume)
      yield
      sleep 1
    end
  end

  def to_s
    "%{A:amixer -q set Master toggle:}#{@icon}  #{@volume}%%{A}     "
  end

private

  def icon volume
    case
    when muted? then "\uf026"
    when volume > 75 then "\uf028"
    when volume > 0 then "\uf027"
    else "\uf026"
    end
  end

  def get_volume
    muted? ? 0 : Integer(amixer.scan(/\d*%/).first.sub("%", ""))
  end

  def muted?
    amixer.scan(/off/).length > 0
  end

  def amixer
    `amixer get Master`.to_s
  end

end
