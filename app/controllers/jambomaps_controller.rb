class JambomapsController < ApplicationController
	before_action :authenticate_user!
	layout 'jambomaps'
	def index
	end
end
