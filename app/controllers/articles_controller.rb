
class ArticlesController < ApplicationController

def show
  @article = Article.find(params[:id])      #finds article
end

  def index
      @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    @article = Article.find(params[:id])
  end

    def create
      @article = Article.new(params.require(:article).permit(:title, :description))
      @article.user = User.first
# if the query is saved then display flash message
      if @article.save
        flash[:success] = "Query was successfully created."
        redirect_to @article
      else
        render 'new'
      end

    end

    def update
      @article = Article.find(params[:id])
      if @article.update(params.require(:article).permit(:title, :description))
        flash[:success] = "Query was updated successfully."
        redirect_to @article
      else
        render 'edit'
      end
    end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  flash[:danger] = "Query was deleted."
  redirect_to articles_path
end

end
