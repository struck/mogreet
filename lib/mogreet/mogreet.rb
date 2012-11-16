require 'rest-client'
require 'crack/xml'

module Mogreet
  def self.config
    @@config ||= Config.new
  end
  
  def self.configure
    @@config = Config.new
    yield config
  end
    
  def self.endpoint(method)
    File.join (config.api_url || "https://api.mogreet.com/moms/"), method
  end

  # Returns a hash containing the client_id and token 
  def self.auth
    {
      client_id: config.client_id,
      token: config.token
    }
  end

  # Returns a hash containing proxy values if they are set in the config.
  # Allows default options to be passed in via the 'default' argument
  # def self.proxy_options(defaults={})
  #   options = defaults.dup
  #   options[:http_proxyaddr] = config.proxy_url if config.proxy_url.present?
  #   options[:http_proxyport] = config.proxy_port if config.proxy_port.present?
  #   options[:http_proxyuser] = config.proxy_username if config.proxy_username.present?
  #   options[:http_proxypass] = config.proxy_password if config.proxy_password.present?
  #   options
  # end
  def self.proxy_url
    unless config.proxy_url.nil?
      uri = URI.parse config.proxy_url
      uri.port = config.proxy_port unless config.proxy_port.nil?
      uri.user = config.proxy_username unless config.proxy_username.nil?
      uri.password = config.proxy_password unless config.proxy_password.nil?
      uri.to_s
    end
  end

  def self.get_response(method, params=nil, options={})
    # options = proxy_options.merge options
    # proxy_options = self.proxy_option.merge options.slice(:http_proxyaddr, :http_proxyport, :http_proxyuser, :http_proxypass)

    # Construct the query string options
    (options[:params] ||= {}).merge! (params || {})
    options[:params] = self.auth.merge options[:params]

    # Resolve the endpoint. Caller can pass :endpoint as full url or 
    # :method which will construct the endpoint automatically.
    # endpoint = options.delete :endpoint
    # endpoint = self.endpoint options.delete(:method) if endpoint.blank?
    endpoint = options.delete(:endpoint) || self.endpoint(method)

    # response = HTTParty.get(endpoint, options)
    if config.proxy_url
      # set the proxy
      save_proxy = RestClient.proxy
      RestClient.proxy = self.proxy_url
    end
    response = RestClient.get endpoint, options
    # reset to the former proxy
    RestClient.proxy = save_proxy if config.proxy_url
    Crack::XML.parse(response.body)['response']

  end

end