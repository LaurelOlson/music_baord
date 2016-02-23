class User < ActiveRecord::Base

  has_many :songs

  validates :username,
    presence: true,
    uniqueness: true

  validates :password,
    presence: true,
    length: { minimum: 6 }

  # validate :login

  # def login
  #   if User.find_by(params[:username], params[:password])
  #     session[:id] = @user.id
  #     erb :'users/account' 
  #   elsif @user 
  #     message = 'Incorrect password'
  #     erb :'users/login'
  #   else
  #     message = 'Invalid user'
  #     erb :'users/login'
  #   end
  # end

end