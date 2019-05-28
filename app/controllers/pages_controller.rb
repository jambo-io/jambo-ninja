 class PagesController < ApplicationController
    before_action :authenticate_user!
    layout 'workspace'
    
    def show
    	#render template: "pages/#{params[:page]}"
    end
    def themes
    end
    def about
    end
    def local
    end
     def test

     end

  end  
