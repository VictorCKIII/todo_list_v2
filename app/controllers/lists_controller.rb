class ListsController < ApplicationController
	def index
		@lists = List.all
	end

	def show 
		@list = List.find(params[:id])
		@item = Item.new
	end

	def new
		@list = List.new	
	end

	def create
		@list = List.new(list_params)
		if @list.save
			redirect_to @list
		else
			render :new
		end
	end

	# def edit
  	# 	@list = List.find(params[:id])
	# end

	def destroy
		@list = List.find(params[:id])
		@list.destroy
        redirect_to lists_path, notice: "Lista deletada com sucesso."

	end


	private

	def list_params
		params.require(:list).permit(:title)
		
	end

end

