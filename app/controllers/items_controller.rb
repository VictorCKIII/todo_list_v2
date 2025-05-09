class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: [:edit, :update]

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)

    if @item.save
      redirect_to @list, notice: 'Item criado com sucesso!'
    else
      @items = @list.items
      @item = @list.items.build 
      render 'lists/show', status: :unprocessable_entity
    end
  end


  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to @list, notice: 'Item atualizado com sucesso.'
    else
      render :edit
    end
  end

  def show
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id]) 
  end

  def destroy 
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    @item.destroy
    redirect_to list_path(@list), alert: "Item deletado com Sucesso"
  end
  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_item
    @item = @list.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:content, :done)
  end
end
