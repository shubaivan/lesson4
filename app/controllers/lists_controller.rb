class ListsController < ApplicationController
  before_action :authorize
  before_action :find_list, except: [:index, :create]

  def index
    @lists = List.for(current_user)
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    redirect_to list_tasks_path(@list.id)
  end

  def create
    @list = current_user.lists.create(list_params)
    redirect_to list_tasks_path(@list.id) if @list.save
  end

  def update
    @list = List.find(params[:id])
    User.find_by(id: params[:user_id]).shared_lists << @list
    redirect_to list_tasks_path(@list)
  end

  def update
    @list.users << User.where(id: params[:user_id])
  end

  def destroy
    @list.destroy
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
