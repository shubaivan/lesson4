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
    if @list.save
      redirect_to list_tasks_path(@list.id)
    end
  end

  def show
    @list = List.find(params[:id])
    redirect_to list_tasks_path(@list.id)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

  end

  private

  def list_params
    params.require(:list).permit(:list, :title)
  end
end
