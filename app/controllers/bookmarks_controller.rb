class BookmarksController < ApplicationController
  before_action :find_bookmark, except: [ :index, :new, :create ]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render :new
    end
  end

  def show; end

  def destroy
    
    @bookmark.destroy
    redirect_to root_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def find_bookmark
    #@bookmark = Bookmark.find(params[:id])
    @list = List.find(params[:id])
  end
end
