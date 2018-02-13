
require 'yaml'
require 'json'

class BarConfig

  CONFIG = JSON.parse(YAML.load_file(File.expand_path("../config.yml", __FILE__)).to_json, object_class: OpenStruct)

  def initialize
  end

  def bar_command
    cmd = ["| lemonbar -p"]
    cmd << "-d" if lemonbar.docked
    cmd << "-g #{lemonbar.geometry}"
    cmd << "-B \"#{lemonbar.background}\""
    cmd << "-F \"#{lemonbar.foreground}\""
    cmd << "-u 2"
    lemonbar.fonts.each do |fconf|
      cmd << "-f \"#{fconf.font}\""
      cmd << "-o #{fconf.offset}" unless fconf.offset.nil?
    end
    cmd.join(" ")
  end

  def widgets
    copy = CONFIG.dup.to_h
    copy.delete(:lemonbar)
    copy
  end

  def format
    lemonbar.format
  end

  def get(key)
    CONFIG[key]
  end

private

  def lemonbar
    CONFIG.lemonbar
  end

end
