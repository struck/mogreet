class Mogreet::User

  UNSEEN = -1 # User  is  unknown to  the campaign.
  OPTEDIN = 1 # User  is  opted into  the campaign.
  OPTEDOUT = -2 # User  is  opted out of  the campaign.
  GREY = 0 # User  has been  asked to  join  the campaign  but has not yet confirmed joining.

  class << self

    # The getopt method returns the opt in status of any mobile number.
    def getopt(options)
      raise 'todo'
    end

    # The setopt method sets the opt in status of any mobile number.
    # Options:
    #   number: A mobile  number  (MSISDN)  to  opt in  or  out of  a campaign.
    #   campaign_id: A  campaign  id  to  change  the opt in  status  for.
    #   status_code: 
    def setopt(query={}, options={})
      raise ArgumentError.new "The number option is required." unless query.has_key?(:number)
      raise ArgumentError.new "The status_code option is required." unless query.has_key?(:status_code)
      raise ArgumentError.new "The campaign_id option is required." unless query.has_key?(:campaign_id)
      method = "user.setopt"
      Mogreet::Response::Base.new Mogreet.get_response(method, query, options)
    end

    # def unsee

    # The uncache method clears the user carrier and handset info from the Mogreet 
    # cache. This method should be used in cases where a user recently switched 
    # carriers/networks or handsets.
    def uncache(options)
      raise 'todo'
    end

    # The info method returns the user carrier and handset info if available.
    # Arguments:
    #   number: A mobile number (MSISDN). 
    def info(query=nil, options={})
      # options[:number] ||= options.delete(:phone) if options.has_key? :phone
      # options[:endpoint] ||= Mogreet.endpoint("user.info")
      # options[:method] ||= "user.info" unless options.has_key? :endpoint
      method = "user.info"
      Mogreet::Response::Base.new Mogreet.get_response(method, query, options)
    end
    def info!(query=nil, options={})
      response = info(query, options)
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
