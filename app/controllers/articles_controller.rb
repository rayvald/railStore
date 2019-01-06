class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_path, notice: "Article was successfuly created" }
      else
        format.html{render 'articles/new'}
      end
    end
  end

  def index
    @articles = Article.all # PREGUNTAR POR QUÉ ESTA LLEVA S
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_path(@article), notice: "Article was successfully updated"}
      else
        format.html {render 'articles/edit'}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @article.destroy
        format.html { redirect_to articles_path, notice: "Article was successfully deleted"}
      else
        format.html {redirect_to articles_path}
      end
    end
  end

end

private
def article_params
  params.require(:article).permit(:title, :description, :author)
end

def set_article
  @article = Article.find(params[:id])
end
