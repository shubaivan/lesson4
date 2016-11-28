class ListsController < ApplicationController
  before_action :authorize

  def index
    @lists = List.for(current_user)
    new
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.create(list_params)
    redirect_to list_tasks_path(@list.id) if @list.save
  end

  def show
    @list = List.find(params[:id])
    redirect_to list_tasks_path(@list.id)
  end

  def update
    @list = List.find(params[:id])
    User.find_by(id: params[:user_id]).shared_lists << @list
    redirect_to list_tasks_path(@list)
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
