class ListsController < ApplicationController
before_action :find_list, except: [ :index, :new, :create ]
def index 
  @lists = List.all
end

def show
  #@list = List.new
end

def new
  @list = List.new
end

def create 
  @list = List.new(list_params)
  if @list.save
    redirect_to list_path(@list)
  else
    render :new
  end
end

private

def list_params
  params.require(:list).permit(:name)
end

def find_list
  @list = List.find(params[:id])
end
end
