class User < ApplicationRecord
  after_save :send_welcome
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def send_welcome
    WelcomeWorker.perform_async(self.id)
  end

end
