class Admin::DashboardsController < Admin::AdminController
    def index
		@participants = Participant.order('id desc').all
		@user = User.find(current_user.id)
		unless @user.blank?
			@eventosbahais = @user.eventosbahais.order('id desc')
		end
		@size = 1
    end

end
