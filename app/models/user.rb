class User < ApplicationRecord

  has_one :profile, dependent: :destroy

  require 'jwt'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable,:trackable, :validatable


  def generate_jwt
      JWT.encode({ id: id,exp: 60.days.from_now.to_i },Rails.application.secrets.secret_key_base, 'none')
  end

end
