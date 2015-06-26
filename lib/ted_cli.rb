require 'httparty'
require 'yaml'

require "ted-cli/version"
require "ted-cli/composite_talk"
require "ted-cli/error_object"
require "ted-cli/talk"

module TedCli
  API_PATH = "http://api.ted.com/v1"
  GEM_PATH = Gem::Specification.find_by_name("ted-cli").gem_dir
  
  def self.api_key=(key)
    data = {"apikey" => key}
    File.open(GEM_PATH + "/conf.yml", "w+") {|f| f.write(data.to_yaml) }
  end

  def self.api_key
    y = YAML::load_file(GEM_PATH + '/conf.yml')
    y['apikey']
  rescue
    false
  end
end