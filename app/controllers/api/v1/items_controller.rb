class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    if logged_in?
      @items = current_user.items
      render json: ItemSerializer.new(@items)
    else
      render json: {error: "You must be logged in to see Notes"}
    end
  end

  def show
    render json: @item
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      render json:  ItemSerializer.new(@item), status: :created
    else
      error_resp = {error: @item.errors.full_messages.to_sentence}
      render json: error_resp, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json:  ItemSerializer.new(@item), status: :ok
    else
      error_resp = {error: @item.errors.full_messages.to_sentence}
      render json: error_resp, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      render json:  { data: "Note successfully destroyed" }, status: :ok
    else
      error_resp = {error: "Note NOT found and NOT destroyed"}
      render json: error_resp, status: :unprocessable_entity
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:notes)
  end
  
end