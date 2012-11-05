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
    def info(options)
      raise 'todo'
    end

    # The transactions method returns the user’s transactions (open and closed). This 
    # method should be used for debugging purposes and customer service assistance in 
    # conjunction with transaction.lookup.
    def transactions(options)
      raise 'todo'
    end

  end
end
