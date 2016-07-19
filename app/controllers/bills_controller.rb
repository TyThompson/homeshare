class BillsController < ApplicationController
  # before_action :check_login, except: [:show, :index, :search]
  before_action :set_bill, except: [:create, :new, :index]
  # before_action :check_user, only: [:update, :destroy]

  def create
    @bill = Bill.new(bill_params)
    @bill.thumbs_up = 0
    if @bill.save
      render :show
    else
      render @bill.errors
    end
  end

  def new
    create
  end

  def destroy
    @bill.destroy
  end

  def update
    if @bill.update(bill_params)
      render :show
    else
      render @bill.errors
    end
  end

  def edit
    update
  end

  def index
    @home = Home.find_by(params[:id])
    @bills = @home.bills
  end

  def show
    @bill
  end

  private

  def set_bill
    begin
      @bill = Bill.where(id: params[:id], home_id: params[:home_id])
    rescue
      render 'not_found'
    end
  end

  def bill_params
    params.permit(:user_id, :home_id, :name, :amount, :due, :completed_at)
  end
end
