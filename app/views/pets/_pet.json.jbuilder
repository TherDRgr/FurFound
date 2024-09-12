json.extract! pet, :id, :name, :color, :breed, :species, :user_id, :photo, :created_at, :updated_at
json.url pet_url(pet, format: :json)
