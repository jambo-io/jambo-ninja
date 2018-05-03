class DrivesController < ApplicationController
  #API KEY2:AIzaSyAJLvr-95bsey80JLKl7TW5yMknazEIOMo]

    require 'google/apis/drive_v3'
    require 'googleauth'
    require 'googleauth/stores/file_token_store'




    def initialize

        client_id = Google::Auth::ClientId.from_file('config/client_secret_995492372788-f5r3pocfovtjppv1v15moekme3k7mqu0.apps.googleusercontent.com.json')
        scope = Google::Apis::DrivesV3::AUTH_SPREADSHEETS_READONLY
        token_store = Google::Auth::Stores::FileTokenStore.new(file: 'config/store.yaml')
        authorizer = Google::Auth::WebUserAuthorizer.new(client_id, scope, token_store)
        user_id = 'default'

        credentials = authorizer.get_credentials(user_id,scope)
        @output = credentials



    end






end
