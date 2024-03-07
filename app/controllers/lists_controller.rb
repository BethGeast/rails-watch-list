class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_strong_params)
    if @list.save
      redirect_to list_path(@list), notice: 'New list successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_strong_params
    params.require(:list).permit(:name)
  end
end
