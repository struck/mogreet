class Mogreet::Transaction
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
    # 
    # Standard Options:
    #   client_id: Your client id. Log onto the Campaign Manager to access your client id. 
    #   token: Your token. Log onto the Campaign Manager to access your token. 
    #   campaign_id: An ID connected to a specific campaign setup in the Campaign Manager or  provided by your account representative. 
    #   to: The mobile number (MSISDN) of the handset you would like to send to. 
    #   from: The mobile number (MSISDN) of the handset you would like to send from. Or the  shortcode associated with the campaign. (Optional – if not included, this  parameter will default to the shortcode associated to the campaign).  
    #   message: Depending on your campaign set up, the message presented to the “to” user. 
    #   content_id: An integer value associated to a piece of content ingested through the Campaign  Manager. You’ll find all your content ids under the media section. (Optional, used   for SMS and MMS delivering audio, image or video)
    #   content_url: A publicly accessible URL of an image, audio or video. MOMS will automagically  ingest the content and deliver it as specified by the campaign flow. (Optional,  used  for SMS and MMS delivering audio, image or video) 
    #   to_name: DEPRECATED see udp_* parameter below ` Depending on your campaign setup,  you may provide the receiver’s name along with the message. 
    #   from_name: DEPRECATED see udp_* parameter below ` Depending on your campaign setup,  you may provide the sender’s name along with the message. 
    #   callback: If provided with a valid URL, any errors with the transaction will be sent to this  URL via XML over HTTP.  See description below. 
    #   udp_*: UDP stands for user defined parameter. You may pass in any number of udp_*  parameters as you like. UDPs are customized to your campaign flow. Your  account representative will work with you to get customize UDPs to fit your  needs. see description below
    # 
    # Additional Options:
    #   endpoint: A custom endpoint url. (Mogreet will set up custom client endpoints for some circumstances)
    # 
    def send(options={})
      options[:endpoint] = Mogreet.default_endpoint("transaction.send") unless options.has_key?(:endpoint)
      puts "-------------"
      puts options
      Mogreet::Response::TransactionSend.new Mogreet.get_response(options)
    end
    # Executes the same method as `send` but raises errors when the response is an error response.
    def send!(options={})
      response = send(options)
      response.raise_response_errors
      response
    end


    # The lookup method returns info, status, and history of the requested transaction. 
    def lookup(options)
      raise 'todo'
    end

  end
end