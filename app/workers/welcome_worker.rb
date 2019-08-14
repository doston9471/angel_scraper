class WelcomeWorker
  include Sidekiq::Worker

  def perform(user)
    mail = UsersMailer.welcome_email(user.id)
    mail.deliver_now
  end
end
