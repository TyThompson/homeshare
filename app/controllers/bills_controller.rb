class BillsController < ApplicationController
  # before_action :check_login, except: [:show, :index, :search]
  before_action :set_bill, except: [:create, :index]
  # before_action :check_user, only: [:update, :destroy]

  def create
    @bill = Bill.new(bill_params)
    @bill.user_id = current_user.id
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

  def paid #GET request to view house bills that have been marked as "paid"
    @home = Home.find params[:home_id].to_i
    @bills = @home.bills.where(paid: true).all
  end

  def mark_paid #POST request to here simply marks bill as "paid", assigns current_user as payer, & timestamps payment
    @bill.paid_by = current_user.id
    @bill.paid = true
    @chore.paid_at = Time.now
  end

  # def pay_user
  #   @venmo_user = User.where(email: current_user.email).pluck(:venmo_username)
  #   @venmo_payee = User.where(email: params[:payee]).pluck(:venmo_username)
  # end

  private

  def set_bill
    begin
      @bill = Bill.find_by(id: params[:id].to_i, home_id: params[:home_id].to_i)
    rescue
      render :not_found
    end
  end

  def bill_params
    params.require(:bill).params.permit(:user_id, :home_id, :name, :amount, :due, :completed_at)
  end
end
