module Mogreet::Response
  class Base < Hashie::Mash

    def initialize(response)
    #   # puts response.body
    #   # puts Crack::XML.parse(response.body)#['response']
    #   # super Crack::XML.parse(response.body)#['response']
      super

      puts response

      if self.status.to_sym == :error
        raise_response_error
      end

    end

    protected

    def raise_response_error
      case self.code.to_i
      when 400 then raise Mogreet::RejectedException.new(self.message, self.code)
      when 404 then raise Mogreet::UnknownRequestException.new(self.message, self.code)
      when 430..499 then raise Mogreet::InvalidRequestException.new(self.message, self.code)
      when 500 then raise Mogreet::InternalErrorException.new(self.message, self.code)
      when 600..601 then raise Mogreet::InternalErrorException.new(self.message, self.code)
      when 602..699 then raise Mogreet::UserException.new(self.message, self.code)
      else
        raise Exception(self.message)
      end
    end

  end
end