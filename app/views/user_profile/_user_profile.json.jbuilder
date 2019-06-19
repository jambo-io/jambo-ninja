json.extract! user_profile, :id, :name, :lastname, :birthday, :email, :phone, :state, :city, :address, :number, :zipcode, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
