class ListsController < ApplicationController
before_action :find_list, except: [ :index, :new, :create ]
def index 
  @lists = List.all
end

def show
  #@bookmarks = Bookmark.where("list_id = '#{@list.id}'")
  @bookmarks = Bookmark.find_by(list_id: @list.id)
  #raise
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
