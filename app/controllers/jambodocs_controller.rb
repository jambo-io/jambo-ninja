class JambodocsController < ApplicationController
  layout 'workspace'
  def index
    @jambodocs = Jambodoc.order('id desc').all
  end
  def show
    @jambodoc = Jambodoc.find(params[:id])

  end
  def new
    @jambodoc = Jambodoc.new
  end
  def create

    @jambodoc = Jambodoc.create(jambodoc_params)

    #Email check
    recipient = params[:recipient]
    subject = params[:subject]
    message = params[:message]
    check1 = params[:check1]
    check2 = params[:check2]
    commit = params[:commit]

    #Take all parameters and add in a Hash
    docdata = {}
    docdata[:recipient] = recipient
    docdata[:subject] = subject
    docdata[:message] = message
    docdata[:send_as_message] = check1
    docdata[:send_as_attachment] = check2


    #Send Email
    #Check if button to send Email was clicked instead of Save
    unless recipient.blank?
      if commit == "Enviar"

        JambodocsMailer.send_doc(docdata, @jambodoc).deliver_later

      end
    end


    if @jambodoc.save
      redirect_to jambodocs_path
    end

  end
  def edit

    @jambodoc = Jambodoc.find(params[:id])
    puts @jambodoc.inspect
  end

  def update
    @jambodoc = Jambodoc.find(params[:id])
    if @jambodoc.update_attributes(jambodoc_params)
      redirect_to jambodoc_path(@jambodoc)
    end

  end

  private
  def jambodoc_params
    params.require(:jambodoc).permit(:title,:text)
  end


end
