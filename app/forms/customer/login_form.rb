class Customer::LoginForm
  include ActiveModel::Model

  attr_accessor :email,:customer_name, :password, :confirm_password
end
