require 'hashie'

class Mogreet::Config < Hashie::Mash
  
  def initialize
    # Automatic configuration
    self.client_id   ||= ENV['MOGREET_CLIENT_ID']
    self.token       ||= ENV['MOGREET_API_TOKEN']
    self.api_url     ||= ENV['MOGREET_API_URL']

    # If requests should be passed through a proxy
    self.proxy_url      ||= ENV['MOGREET_PROXY_URL']      if ENV.has_key?('MOGREET_PROXY_URL')
    # self.proxy_port     ||= ENV['MOGREET_PROXY_PORT']     if ENV.has_key?('MOGREET_PROXY_PORT')
    # self.proxy_username ||= ENV['MOGREET_PROXY_USERNAME'] if ENV.has_key?('MOGREET_PROXY_USERNAME')
    # self.proxy_password ||= ENV['MOGREET_PROXY_PASSWORD'] if ENV.has_key?('MOGREET_PROXY_PASSWORD')
  end  

end