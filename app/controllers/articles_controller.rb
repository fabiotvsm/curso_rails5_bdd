class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index 
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
       flash[:sucess] = "The article has been created"
       redirect_to articles_path
    else
      flash[:danger] = "Article has not been created"
      render :new
    end
  end

  def show  
  end

  def edit   
    unless @article.user == current_user
      flash[:alert] = "You can't edit others people articles"
      redirect_to root_path
      
    end
  end

  def update
    @article.update(article_params)
      flash[:success] = "Article has been updated"
      redirect_to @article 
      # else
      # flash.now[:danger] = "Article has not been updated"
      # render :edit
      # end
  end

  def destroy
    unless @article.user == current_user
      flash[:alert] = "You can't edit others people articles"
      redirect_to root_path
      
    else 
      @article.destroy
      redirect_to articles_path
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
    
  def article_params
    params.require(:article).permit(:title, :body)
  end


end
