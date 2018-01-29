require 'yaml'
require 'json'
require 'date'
require 'fileutils'

def create_backup_directory home
  dir = "#{home}/dotfiles_bak/#{DateTime.now.strftime("%s")}"
  FileUtils::mkdir_p dir
  dir
end

config = YAML.load_file("config.yml")
config["backup_dir"] = create_backup_directory config["home"]
File.write("solo.json", config.to_json)
