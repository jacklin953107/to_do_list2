class ListsController < ApplicationController
  before_action :set_list, :only=>[:show, :edit, :update, :destroy]
  def index
    @lists = List.all
  end
  def new
    @list = List.new
  end
  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Create Success!"
      redirect_to lists_url
    else
      render :action => :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @list.update_attributes(list_params)
      redirect_to list_path(@list)
    else
      render :action => :edit
    end
  end
  def destroy
    @list.destroy
    flash[:alert] = "Deleted!"
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:name, :due, :note)
  end
  def set_list
    @list = List.find(params[:id])
  end
end
