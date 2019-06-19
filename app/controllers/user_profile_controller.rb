class UserProfileController < ApplicationController
    before_action :user_profile, only: [:edit, :update]
    before_action :owner_check

    def edit
        @user_profile = user_profile
    end

    def show
        @user_profile = user_profile
    end

    def update
        @redirect_to = params[:redirect_to]
        puts "redirect to"
        puts @redirect_to.inspect
        respond_to do |format|
            if @user_profile.update(user_profile_params)
                notice = 'Perfil atualizado.'
                if(@redirect_to.present?)
                    format.html { redirect_to @redirect_to, notice: notice }
                else
                    format.html { redirect_to root_path, notice: notice }
                end

                format.json { render :show, status: :ok, location: @user_profile }
                
            else
                format.html { render :edit }
                format.json { render json: @user_profile.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def user_profile
        @user_profile = UserProfile.find(params[:id])
    end
   
    def user_profile_params
        params.require(:user_profile).permit(:name, :lastname, :phone, :city, :state, :administrative_region_id, :redirect_to)
    end
    
    def owner_check
        puts "current user"
        @user_profile = UserProfile.find(params[:id])
        puts current_user.user_profile.inspect
        puts @user_profile.inspect
        if user_signed_in? && current_user.user_profile.present?
            if current_user.user_profile == @user_profile || current_user.superuser?
                puts "here"
                return true
            end
        end
        redirect_to root_path
    end
end
