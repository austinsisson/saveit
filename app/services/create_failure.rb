class CreateFailure
  
  def self.call(params)
    RestClient.post 'https://api:"#{MAILGUN_API_KEY}"@api.mailgun.net/V2/app32619189.mailgun.org/messages',
    from:     "Admin <admin@saveit.com>",
    to:       params[:sender],
    subject:  "Create Bookmark Failed!",
    text:     "Oops! Looks like there was an issue with the bookmark you sent us. Please try again. -SaveIt Admin Team"
  end
end