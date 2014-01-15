class UserMailer < ActionMailer::Base
    default from: "pedrozath@gmail.com"
    def contact_notification(contact)
        @contact = contact
        mail to: ENV['EMAIL_RECEIVER'],  
            subject: "Artemys: contato via Site",  
            reply_to: @contact.email
    end

end
