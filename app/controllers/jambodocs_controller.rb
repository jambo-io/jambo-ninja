class JambodocsController < ApplicationController
  layout 'workspace'
  def index

  end
  def show

  end
  def new
    @jambodoc = Jambodoc.new
  end
end
