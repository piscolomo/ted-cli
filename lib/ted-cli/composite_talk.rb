class ErrorObject
  def initialize(message)
    @message = message
  end

  def valid?
    false
  end

  def to_s
    "Error #{@message}"
  end
end

class CompositeTalk
  include HTTParty

  def initialize
    @talks = []
  end

  def << (talk)
    @talks << talk
  end

  def valid?
    true
  end

  def list
    @talks.map{|t| t[:name] }
  end

  def self.find(keyword)
    response = get("#{TedCli::API_PATH}/talks.json?api-key=#{TedCli.api_key}&name=*#{keyword}*")
    if response.success?
      return ErrorObject.new("Not Found") if response["counts"]["total"] == 0
      composite = self.new
      response["talks"].each do |t|
        composite << {id: t["talk"]["id"], name: t["talk"]["name"]}
      end
    else
      ErrorObject.new("We're not sure...")
    end
    composite
  rescue JSON::ParserError => e
    ErrorObject.new("Your api key is wrong!")
  end
end