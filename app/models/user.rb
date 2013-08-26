class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  has_many :comments

  has_secure_password validations: false
end
