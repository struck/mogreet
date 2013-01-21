module Mogreet
  class RejectedException < ArgumentError
    # extend RequestException
    attr_reader :code
    def initialize(msg=nil, code=nil)
      super("#{msg} (Error Code #{code})")
      @code = code
    end
  end
  class ForbiddenException < RejectedException
  end
  class UnknownRequestException < ArgumentError
    # extend RequestException
    attr_reader :code
    def initialize(msg=nil, code=nil)
      super("#{msg} (Error Code #{code})")
      @code = code
    end
  end
  class InvalidRequestException < UnknownRequestException
  end
  class InternalErrorException < StandardError
    # extend RequestException
    attr_reader :code
    def initialize(msg=nil, code=nil)
      super("#{msg} (Error Code #{code})")
      @code = code
    end
  end
  class UserException < InternalErrorException
  end
end