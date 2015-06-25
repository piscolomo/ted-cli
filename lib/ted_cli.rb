require 'httparty'
require 'yaml'

require "ted-cli/version"
require "ted-cli/talk"

module TedCli
  def self.api_key=(key)
    y = YAML::load_file('conf/conf.yml')
    y['content']['apikey'] = key
    File.open('conf/conf.yml', 'w') {|f| f.write y.to_yaml }
  end

  def self.api_key
    y = YAML::load_file('conf/conf.yml')
    y['content']['apikey']
  end
end