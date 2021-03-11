class User < ApplicationRecord
    has_secure_password
    has_many :schedules

    validates_presence_of :name, message: 'O nome não pode ser deixado em branco'
    validates_presence_of :email, message: 'O e-mail não pode ser deixado em branco'
    validates_presence_of :password, message: 'A senha não pode ser deixada em branco'
    validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i , message: 'Diferente de email'
    validates_uniqueness_of :email, message: 'E-mail igual já foi adicionado'
end
