class BillsController < ApplicationController
  before_action :set_bill, except: [:create, :index]

  def create
    @bill = Bill.new(bill_params)
    @bill.user_id = current_user.id
    @bill.user_avatar = current_user.avatar
    @home = Home.find params[:home_id].to_i
    @bill.home_id = @home.id
    @bill.created_at = Time.now.strftime("%A, %B %e, %Y %l:%M %P %Z")
    if @bill.save
      render :show, status: 201
    else
      render :error
    end
  end


  def destroy
    authorize @bill
    @bill.destroy
  end


  def update
    if @bill.update(bill_params)
      render :show, status: 200
    else
      render :error
    end
  end


  def index
    @home = Home.find params[:home_id].to_i
    @bills = @home.bills
  end


  def show
    @bill
  end


#GET request to view house bills that have been marked as "paid"
  def paid
    @home = Home.find params[:home_id].to_i
    @bills = @home.bills.where(paid: true).all
  end


#POST request to send Paypal payment of total amount of bill from current_user to
#user who posted bill. Sandbox credentials.
  def pay
    @bill = Bill.find_by(id: params[:bill_id].to_i, home_id: params[:home_id].to_i)
    @payment = Payment.new(description: @bill.name, amount: @bill.amount,
      recipient_paypal_email: @bill.user.paypal)
    @recipient = @payment.recipient_paypal_email
    @payment.sender_paypal_email = current_user.paypal
    @payment.paid_at = Time.now.strftime("%A, %B %e, %Y %l:%M %P %Z")
    @amount = @payment.amount
    request = HTTParty.post("https://svcs.sandbox.paypal.com/AdaptivePayments/Pay",
      headers: {"X-PAYPAL-SECURITY-USERID" => "maria.cassino-facilitator_api1.gmail.com",
                "X-PAYPAL-SECURITY-PASSWORD" => "U9FL2MK962DKPXMR",
                "X-PAYPAL-SECURITY-SIGNATURE" => "AFcWxV21C7fd0v3bYYYRCpSSRl31A2tjSJXfuAz3het2TLAiz2uCt1eN",
                "X-PAYPAL-REQUEST-DATA-FORMAT" => "JSON",
                "X-PAYPAL-RESPONSE-DATA-FORMAT" => "JSON",
                "X-PAYPAL-APPLICATION-ID" => "APP-80W284485P519543T"
                },
      body:   {actionType: "PAY",
               currencyCode: "USD",
               receiverList: {
                  receiver:[
                             {amount: @amount,
                              email: @recipient}
                            ]
                      },
               returnUrl: "http://www.example.com/success.html",
               cancelUrl: "http://www.example.com/failure.html",
               requestEnvelope:{
               errorLanguage: "en_US",
               detailLevel: "ReturnAll"
                }}.to_json
                )
    @payment.save
    @bill.paid_by = current_user.id
    @bill.paid = true
    @bill.paid_at = Time.now.strftime("%A, %B %e, %Y %l:%M %P %Z")
    @bill.save
    render :payment
  end



  private

  def set_bill
    begin
      @bill = Bill.find_by(id: params[:id].to_i, home_id: params[:home_id].to_i)
    rescue
      render :not_found
    end
  end

  def bill_params
    params.require(:bill).permit(:user_id, :home_id, :name, :amount, :due, :paid_at,
    :user_avatar, :paid_by, :paid, :bill_id)
  end
end
