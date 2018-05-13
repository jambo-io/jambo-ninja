class JambodocsMailer < ApplicationMailer
  default from: 'jamboninja@example.com'

  def send_doc(docdata, jambodoc)

    print "Docdata to send"
    puts docdata.inspect

    recipient = docdata[:recipient]
    subject = docdata[:subject]
    message = docdata[:message]
    send_as_message = docdata[:send_as_message]

    #Check the option to send the Email in the body or attachment
    if send_as_message == "1"
      @title = jambodoc.title
      @text = jambodoc.text
    elsif send_as_message == "0"
      @text = message
    end

    #docdata[:send_as_attachment]

    mail(to: recipient, subject: subject)

  end
end
