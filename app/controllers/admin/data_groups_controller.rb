class Admin::DataGroupsController < Admin::AdminController
    before_action only: [:show] do 
        is_owner? ('Eventosbahai')
    end

    def show
        require 'json'
        @event = Eventosbahai.find(params[:id])
        participants = @event.participants
        @administrative_regions = AdministrativeRegion.all

        @participants = participants.to_json
        
        
        puts @participants.inspect

    end


   
end