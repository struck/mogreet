module Mogreet
  def self.config
    @@config ||= Config.new
  end
  
  def self.configure
    @@config = Config.new
    yield config
  end
  
  def self.default_endpoint(action)
    "https://api.mogreet.com/moms/#{action}"
  end

  def self.get_response(options)
    response = HTTParty.get(options[:endpoint], query: Mogreet.config.merge(options).to_hash)
    Crack::XML.parse(response.body)['response']
  end
end