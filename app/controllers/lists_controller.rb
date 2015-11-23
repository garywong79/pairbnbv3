class ListsController < ApplicationController

	def new
	
	end

	def create
		@user = current_user
		@list = @user.lists.new(list_params)
		if @list.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
  end

  def update
  	@list = List.find(params[:id])
    if @list.update(blog_params)
      redirect_to @list
    else
      render :edit
    end
  end

  def destroy
  	@list = List.find(params[:id])
    @list.destroy
    redirect_to root_path
  end

	private
	def list_params
		params.require(:list).permit(:price, :description, :bathroom, :bedroom, :bed, :property_type, :room_type, {images: []})
	end
end
