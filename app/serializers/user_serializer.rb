class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :display_name, :age, :bio, :gender, :looking_for, :zip_code
end
