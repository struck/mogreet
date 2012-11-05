class Mogreet::Message
  class << self

    # Use the send method to initiate an SMS or MMS transaction. The delivery of the 
    # transaction depends on your campaign setup (called the campaign flow). Clients can 
    # customize their campaign flow through the Campaign Manager or with the help of 
    # their account manager. A successful request returns a message id and hash 
    # associated with the transaction created from the request. It’s important to record 
    # and track the response message id and hash if you want to check the status and 
    # history of the transaction using the transaction.lookup method later on; OR if you 
    # opt to receive transaction error messages. If your request includes the callback 
    # argument, should the transaction err, the callback URL will be sent an XML HTTP 
    # POST request with the error and code (see the callback parameter). Clients also 
    # have access to user defined parameters (udp) to further customize their campaigns. 
    # Since campaigns differ from client to client and even from one client’s campaign to 
    # another, the API allows you to customize the experience by submitting your own 
    # user defined parameters (udp). The parameters enable you to customize your 
    # message flow with our product team.
    def send(options)
      response = HTTParty.get("https://api.mogreet.com/moms/transaction.send", query: Mogreet.config.merge(options).to_hash)
      Mogreet::Response::TransactionSend.new Crack::XML.parse(response.body)['response']
    end

    # The lookup method returns info, status, and history of the requested transaction. 
    def lookup(options)
      raise 'todo'
    end

  end
end