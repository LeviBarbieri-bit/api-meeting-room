class User < ApplicationRecord
    has_secure_password

    validates_presence_of :name, message: 'Name cannot be left blank'
    validates_presence_of :email, message: 'Email cannot be left blank'
    validates_presence_of :password, message: 'Password cannot be left blank'

    validates_uniqueness_of :email, message: 'Equal email has already been added'
end
