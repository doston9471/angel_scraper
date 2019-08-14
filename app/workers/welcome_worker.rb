class WelcomeWorker
  include Sidekiq::Worker

  def perform(user_id)
    mail = UserMailer.welcome_email(user_id)
    mail.deliver_now
  end
end
