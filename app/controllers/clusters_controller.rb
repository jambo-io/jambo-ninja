class ClustersController < ApplicationController
  def create
    puts "chegou no create"

    puts cluster_params.inspect

    @current_user = current_user.id
    cluster = Cluster.new(name:cluster_params[:name],city:cluster_params[:city],state:cluster_params[:state], user_id:@current_user)

    cluster.save
    redirect_to user_path(@current_user)
  end
  def update
    @user = User.find(current_user.id)
    if cluster_params[:name].blank? && cluster_params[:city].blank? && cluster_params[:state].blank?
      puts "hora de deletar"
      @user.cluster.destroy
    else
      @user.cluster.update_attributes(cluster_params)
    end
    redirect_to user_path(current_user.id)

  end

  private
  def cluster_params
    params.fetch(:cluster, {}).permit(:name,:city,:state)
  end
end
