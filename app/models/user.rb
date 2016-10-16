class User < ActiveRecord::Base
  has_many :routes
  

   include BCrypt

   def password
      @password ||= Password.new(password_hash) 
      @password
   end

   def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password 
   end
end