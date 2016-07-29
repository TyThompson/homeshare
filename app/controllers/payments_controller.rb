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



  def paypal
    @amount = Payment.find_by(sender_paypal_email: current_user.email).amount
    request = HTTParty.post("https://svcs.sandbox.paypal.com/AdaptivePayments/Pay",
      headers: {"X-PAYPAL-SECURITY-USERID": "maria.cassino-facilitator_api1.gmail.com"
                "X-PAYPAL-SECURITY-PASSWORD": "U9FL2MK962DKPXMR"
                "X-PAYPAL-SECURITY-SIGNATURE": "AFcWxV21C7fd0v3bYYYRCpSSRl31A2tjSJXfuAz3het2TLAiz2uCt1eN"
                "X-PAYPAL-REQUEST-DATA-FORMAT": "JSON"
                "X-PAYPAL-RESPONSE-DATA-FORMAT": "JSON"
                "X-PAYPAL-APPLICATION-ID": "APP-80W284485P519543T"
                },
      data:   {actionType: "PAY",
                currencyCode: "USD",
                receiverList: {
                  receiver:[
                             {amount: @amount,
                              email: "maria.cassino@gmail.com"}
                            ]
                      },
              returnUrl: "http://www.example.com/success.html",
              cancelUrl: "http://www.example.com/failure.html",
              requestEnvelope:{
                errorLanguage: "en_US",
                detailLevel: "ReturnAll"
                })
  end




  def sent_payments
    @payments = Payment.where(sender_paypal_email: current_user.paypal_email)
  end


  def received_payments
    @payments = Payment.where(recipient_paypal_email: current_user.paypal_email)
  end


  private


  def payment_params
    params.require(:payment).permit(:title, :description, :amount,
    :recipient_paypal_email)
  end


end
