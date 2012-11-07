class Mogreet::User
  class << self

    # The getopt method returns the opt in status of any mobile number.
    def getopt(options)
      raise 'todo'
    end

    # The setopt method sets the opt in status of any mobile number.
    def setopt(options)
      raise 'todo'
    end

    # The uncache method clears the user carrier and handset info from the Mogreet 
    # cache. This method should be used in cases where a user recently switched 
    # carriers/networks or handsets.
    def uncache(options)
      raise 'todo'
    end

    # The info method returns the user carrier and handset info if available.
    # Arguments:
    #   number: A mobile number (MSISDN). 
    def info(options={})
      # options[:number] ||= options.delete(:phone) if options.has_key? :phone
      options[:endpoint] ||= Mogreet.default_endpoint("user.info")
      Mogreet::Response::Base.new Mogreet.get_response(options)
    end
    def info!(options={})
      response = info(options)
      response.raise_response_errors
      response
    end

    # The transactions method returns the user’s transactions (open and closed). This 
    # method should be used for debugging purposes and customer service assistance in 
    # conjunction with transaction.lookup.
    def transactions(options)
      raise 'todo'
    end

  end
end
