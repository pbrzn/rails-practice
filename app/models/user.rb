class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true
  validates :password, format: PASSWORD_REQUIREMENTS

  PASSWORD_REQUIREMENTS = /\A
  (?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[[:^alnum:]])
  /x
end
