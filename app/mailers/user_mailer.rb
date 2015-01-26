class UserMailer < ActionMailer::Base
  def bookmark_creation_failure(params)
    mail(to: params[:sender], subject: 'Bookmark Creation Failed!', from: 'admin@saveit.com')
  end
end