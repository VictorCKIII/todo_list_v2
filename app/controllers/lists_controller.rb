class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @item = @list.items.build
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if List.exists?(title: list_params[:title])
      redirect_to new_list_path, alert: "Esta Lista já existe"
    elsif @list.save
      redirect_to lists_path, notice: "Lista criada com sucesso!"
    else

      render :new, status: :unprocessable_entity

    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])

    if List.where(title: list_params[:title]).where.not(id: @list.id).exists?
    redirect_to edit_list_path(@list), alert: "Já existe outra lista com este nome!"

    elsif @list.update(list_params)
      redirect_to lists_path, notice: "Lista Atualizada com sucesso "
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
        redirect_to lists_path, alert: "Lista deletada com sucesso."
  end


  private

  def list_params
    params.require(:list).permit(:title)
  end
end
