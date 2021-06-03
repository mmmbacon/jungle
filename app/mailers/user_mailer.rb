class UserMailer < ApplicationMailer

  default from: "no-reply@jungle.com"

  def confirmation_email(order)
    @order = order
    p "Order", order.email
    @url  = "http://jungle.com/orders/#{order.id}"
    mail(to: @order.email,
        subject: "Order confirmation for Order Number #{@order.id}") do |format|
      format.html { render 'confirmation_email' }
      format.text { render text: 'confirmation_email' }
    end
  end
end
