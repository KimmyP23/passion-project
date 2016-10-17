require 'bcrypt'
class User < ActiveRecord::Base
  has_many :routes

  validates :email, uniqueness: true
  validates :password_hash, :email, :username, presence: true


   include BCrypt

   def password
      @password ||= Password.new(password_hash) 
      @password
   end

   def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password 
   end

   def self.authenticate(email, password)
    @user = User.find_by(email: email)
    if @user.password == password 
      return @user
    else 
      return nil 
    end 
  end 
end