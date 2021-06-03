class UserMailerPreview < ActionMailer::Preview
  def confirmation_email
    UserMailer.confirmation_email(order: Order.first)
  end
end
