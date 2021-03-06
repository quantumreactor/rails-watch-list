class ListsController < ApplicationController
before_action :find_list, except: [ :index, :new, :create ]

def index
  @lists = List.all
end

def show
  #@bookmarks = Bookmark.where("list_id = '#{@list.id}'")
  @bookmarks = Bookmark.find_by(list_id: @list.id)
  @review = Review.new
  # if @bookmarks.nil?
  #   @bookmarks =
  # else
  # end
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

def destroy
  @list.destroy
  redirect_to lists_path
end

def edit

end

def update 
end


private

def find_list
  @list = List.find(params[:id])
end

def list_params
  params.require(:list).permit(:name, :photo)
end

end
