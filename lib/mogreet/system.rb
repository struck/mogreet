class Mogreet::System
  class << self

    # Use the ping method to test connectivity and monitor the status of the MOMS API 
    # servers. You do not have to implement a monitoring system; we’ll notify you via 
    # email if there is any interruption to our services. Ping is useful to test your 
    # credentials and whiteMlisted IPs.
    def ping(options={})
      options[:endpoint] ||= Mogreet.default_endpoint("system.ping")
      Mogreet::Response::SystemPing.new Mogreet.get_response(options)
    end
    def ping!(options={})
      response = ping(options)
      response.raise_response_errors
      response
    end

  end
end
