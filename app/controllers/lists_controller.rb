class ListsController < ApplicationController

  def index
    @lists = current_user.lists if current_user
    new
  end


  def new
    @list = List.new
  end

  def create
  @list = current_user.lists.create(list_params)
    respond_to do |format|
      if @list.save
        format.html { redirect_to root_url }
        format.js
      end
    end
  end

  private

  def list_params
    params.require(:list).permit(:list, :title)
  end
end
