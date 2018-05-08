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


    recipient = params[:recipient]
    subject = params[:subject]
    message = params[:message]
    check1 = params[:check1]
    check2 = params[:check2]

    puts recipient
    puts subject
    puts message
    puts check1
    puts check2


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
