
class Playing

  def initialize(config)
    @playing = "asfd"
  end

  def monitor
    loop do
      @playing = currently_playing
      sleep @playing.nil? ? 30 : 5
    end
  end

  def to_s
    @playing.to_s
  end

private

  def currently_playing
    artist = `sp current | grep '^Artist'`
    artist = artist.gsub(/Artist\s*/, '').gsub("\n", '')
    title = `sp current | grep '^Title'`
    title = title.gsub(/Title\s*/, '').gsub("\n", '')
    title ? "#{artist} - #{title}" : nil
  end

  def icon src
    case
      when "spotify" then "\uf1bc"
      when "youtube" then "\uf16a"
      when "soundcloud" then "\uf1be"
    end
  end

end
