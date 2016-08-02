class PaymentsController < ApplicationController


  def sent_payments
    @payments = Payment.where(sender_paypal_email: current_user.paypal)
  end


  def received_payments
    @payments = Payment.where(recipient_paypal_email: current_user.paypal)
  end


  private


  def payment_params
    params.require(:payment).permit(:title, :description, :amount, :recipient_paypal_email)
  end


end
