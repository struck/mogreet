class Mogreet::System
  class << self

    # Use the ping method to test connectivity and monitor the status of the MOMS API 
    # servers. You do not have to implement a monitoring system; we’ll notify you via 
    # email if there is any interruption to our services. Ping is useful to test your 
    # credentials and whiteMlisted IPs.
    def ping(options={})
      response = HTTParty.get("https://api.mogreet.com/moms/system.ping", query: Mogreet.config.merge(options).to_hash)
      Mogreet::Response::TransactionSend.new Crack::XML.parse(response.body)['response']
    end

    # Not available
    # Stubbed out because this method is documented but unavailable in the api docs.
    def status(status)
      raise "Not available"
    end

  end
end