class PaymentsController < ApplicationController


  def pay
    @payment = Payment.new(payment_params)
    @sender = User.find_by(id: current_user.id)
    @recipient = User.find_by(paypal_email: params[:recipient_paypal_email])
    @payment.sender_paypal_email = @sender.email
    @payment.sender_id = current_user.id
    @payment.recipient_id = @recipient.id
    @payment.paid_at = Time.now
    if @payment.save
      render :show, status: 201
    else
      render :error
    end
  end


  def sent_payments
    @user = User.find_by(id: current_user.id)
    @payments = @user.payments.where(sender_paypal_email: current_user.paypal_email)
      render :sent_payments, status: 200
    else
      render :error
    end
  end


  def received_payments
    @user = User.find_by(id: current_user.id)
    @payments = @user.payments.where(recipient_paypal_email: current_user.paypal_email)
      render :received_payments, status: 200
    else
      render :error
    end
  end


  private


  def payment_params
    params.require(:payment).permit(:title, :description, :amount,
    :recipient_paypal_email)
  end


end
