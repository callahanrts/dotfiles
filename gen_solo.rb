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

# Only run specific recipes if a list is given to the install script
if ARGV.length > 0
  config["run_list"] = config["run_list"].select do |recipe|
    ARGV.any?{|r| recipe.match(/#{r}/)}
  end
end

File.write("solo.json", config.to_json)
