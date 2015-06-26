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
      return ErrorObject.new("No talks were found. Try with another word") if response["counts"]["total"] == 0
      composite = self.new
      response["talks"].each do |t|
        composite << {id: t["talk"]["id"], name: t["talk"]["name"]}
      end
    else
      ErrorObject.new("Sorry, an unexpected error have happened, try again.")
    end
    composite
  rescue JSON::ParserError => e
    ErrorObject.new("Your api key is wrong! Set it correctly with ted-cli key YOUR-API-KEY")
  end
end