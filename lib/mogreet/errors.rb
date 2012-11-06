module Mogreet
  class RejectedException < ArgumentError
    # extend RequestException
    attr_reader :code
    def initialize(msg=nil, code=nil)
      super(msg)
      @code = code
    end
  end
  class UnknownRequestException < ArgumentError
    # extend RequestException
    attr_reader :code
    def initialize(msg=nil, code=nil)
      super(msg)
      @code = code
    end
  end
  class InvalidRequestException < ArgumentError
    # extend RequestException
    attr_reader :code
    def initialize(msg=nil, code=nil)
      super(msg)
      @code = code
    end
  end
  class InternalErrorException < StandardError
    # extend RequestException
    attr_reader :code
    def initialize(msg=nil, code=nil)
      super(msg)
      @code = code
    end
  end
  class UserException < StandardError
    # extend RequestException
    attr_reader :code
    def initialize(msg=nil, code=nil)
      super(msg)
      @code = code
    end
  end
end