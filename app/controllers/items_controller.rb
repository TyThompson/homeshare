class ItemsController < ApplicationController
  before_action :set_item, except: [:create, :index]

  def index
    set_home
    @items = Item.find_by(home_id: @home.id, purchased: false)
  end


  def show
    @item
  end


  def create
    set_home
    @item = Item.new(item_params)
    @item.home_id = @home.id
    @item.item_creator = current_user.id
    # # temporary list_id fix
    # @list = List.find_by(home_id: @home.id)
    # @item.list_id = @list.id
    if @item.save
      render :show, status: 201
    else
      render :error
    end
  end


  def update
    if @item.update(item_params)
      render :show
    else
      render :error
    end
  end


  def purchase
    @item.purchaser_id = current_user.id
    @item.purchased = true
    @item.purchased_at = Time.now.strftime("%A, %B %e, %Y %l:%M %P %Z")
    if @item.save
      render :action_successful, status: 200
    else
      render :error
    end
  end


  def purchased_items
    set_home
    @items = @home.list.items.where(purchased: true)
  end


  def destroy
    authorize @item
    @item.destroy
  end





  private

  def set_item
    begin
      @item = Item.find_by(id: params[:id], home_id: params[:home_id])
    rescue
      render :not_found
    end
  end

  def set_home
    begin
      @home = Home.find params[:home_id].to_i
    rescue
      render :not_found
    end
  end

  def item_params
    params.require(:item).permit(:home_id, :title, :description, :item_xp)
  end


end
