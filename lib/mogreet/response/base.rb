module Mogreet::Response
  class Base < Hashie::Mash

    # def initialize(response)
    # #   # puts response.body
    # #   # puts Crack::XML.parse(response.body)#['response']
    # #   # super Crack::XML.parse(response.body)#['response']
    #   super

    #   puts response

    #   if self.status.to_sym == :error
    #     raise_response_error
    #   end

    # end

    def raise_response_errors
      return unless self.status.to_sym == :error

      puts "RAISING MOGREET ERROR ON RESPONSE:"
      puts self.to_yaml

      case self.code.to_i
      when 400 then raise Mogreet::RejectedException.new(self.message, self.code)
      when 0, 403 then raise Mogreet::ForbiddenException.new(self.message, self.code)
      when 404 then raise Mogreet::UnknownRequestException.new(self.message, self.code)
      when 430..499 then raise Mogreet::InvalidRequestException.new(self.message, self.code)
      when 500 then raise Mogreet::InternalErrorException.new(self.message, self.code)
      when 600..601 then raise Mogreet::InternalErrorException.new(self.message, self.code)
      when 602..699 then raise Mogreet::UserException.new(self.message, self.code)
      else
        raise Exception.new(self.message)
      end
    end

    def success?
      self.status.to_sym == :success
    end
    def error?
      self.status.to_sym == :error
    end

  end
end