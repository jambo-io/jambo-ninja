class UserProfileController < ApplicationController
    before_action :user_profile, only: [:edit, :update]
    before_action do
        is_owner? ('UserProfile')
    end

    def edit
        @user_profile = user_profile
    end

    def show
        @user_profile = user_profile
        @user = @user_profile.user
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
        begin
            @user_profile = UserProfile.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            puts "[ Não encontrado User Profile com ID #{params[:id]} ]"
            @user_profile = nil
        end
    end
   
    def user_profile_params
        params.require(:user_profile).permit(:name, :lastname, :phone, :city, :state, :administrative_region_ref, :redirect_to)
    end
    
    
end
