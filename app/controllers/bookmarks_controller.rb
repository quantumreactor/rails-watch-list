class BookmarksController < ApplicationController
  before_action :find_bookmark, only: :destroy
  before_action :set_list, only: [:new, :create]

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    #flash[:notice] = @bookmark.errors.full_messages.to_sentence unless @bookmark.save
    # aqui despliegue el flash
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def show; end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
