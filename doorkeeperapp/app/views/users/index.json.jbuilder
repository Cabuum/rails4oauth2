json.array!(@users) do |user|
  json.extract! user, :id, :full_name, :email, :password, :location, :bio, :age, :birthday
  json.url user_url(user, format: :json)
end
