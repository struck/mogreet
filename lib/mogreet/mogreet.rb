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
  def self.proxy_options(defaults={})
    options = defaults.dup
    options[:http_proxyaddr] = config.proxy_url if config.proxy_url.present?
    options[:http_proxyport] = config.proxy_port if config.proxy_port.present?
    options[:http_proxyuser] = config.proxy_username if config.proxy_username.present?
    options[:http_proxypass] = config.proxy_password if config.proxy_password.present?
    options
  end

  def self.get_response(method, query=nil, options={})
    options = proxy_options.merge options

    # Construct the query options
    (options[:query] ||= {}).merge! (query || {})
    options[:query] = self.auth.merge options[:query]

    # Resolve the endpoint. Caller can pass :endpoint as full url or 
    # :method which will construct the endpoint automatically.
    # endpoint = options.delete :endpoint
    # endpoint = self.endpoint options.delete(:method) if endpoint.blank?
    endpoint = options.delete(:endpoint) || self.endpoint(method)

    response = HTTParty.get(endpoint, options)
    Crack::XML.parse(response.body)['response']
  end
end