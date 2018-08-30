json.extract! contact, :id, :name, :lastname, :birthday, :email, :phone, :state, :address, :number, :pc, :activities, :video, :created_at, :updated_at
json.url contact_url(contact, format: :json)
