class ThemesController < ApplicationController
  def index
    @themes = Theme.all
  end

  def show
    @theme = Theme.find(params[:id])
  end

  def new
    @theme = Theme.new
  end

  def create 
    @theme = Theme.new(theme_params)

    if @theme.save
      redirect_to @theme
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def update
    @theme = Theme.find(params[:id])

    if @theme.update(theme_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def theme_params
    params.require(:theme).permit(:name, :description)
  end
end
