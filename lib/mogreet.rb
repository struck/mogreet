require 'hashie'
require 'httparty'
require 'crack/xml'

require "mogreet/mogreet"
require "mogreet/version"
require "mogreet/config"
require "mogreet/errors"

require "mogreet/response/base"
require "mogreet/response/transaction_send"
require "mogreet/response/system_ping"

module Mogreet
  autoload :System, 'mogreet/system'
  autoload :Transaction, 'mogreet/transaction'
  autoload :User, 'mogreet/user'
end
