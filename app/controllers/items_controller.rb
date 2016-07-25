class ItemsController < ApplicationController
  before_action :set_item, except: [:create, :index]


  def show
    @item
  end


  def create
    @item = Item.new(item_params)
    @item.item_creator = current_user.id
    if @item.save
      render :show
    else
      render :error
    end
  end


  def update
    if @item.update(chore_params)
      render :show
    else
      render :error
    end
  end


  def purchase_item
    @item.purchaser_id = current_user.id
    @item.purchased = true
    @item.purchased_at = Time.now
    if @item.save
      render :show
    else
      render :error
    end
  end


  def purchased_items
    @home = Home.find_by(params[:id])
    @items = @home.list.items.where(purchased: true).all
  end


  def destroy
    @item.destroy
  end





  private

  def set_item
    begin
      @item = Item.find_by(id: params[:id], home_id: params[:home_id], list_id: params[:list_id])
    rescue
      render 'not_found'
    end
  end


  def item_params
    params.require(:item).permit(:home_id, :list_id, :title, :item_xp)
  end


end
