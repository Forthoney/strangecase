class ThemesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_author!, only: [:edit, :update]

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
    @theme = current_user.themes.create(theme_params)

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
    params.require(:theme).permit(:name, :description, images: [])
  end

  def authenticate_author!
    redirect_to root_path unless @theme.user_id == current_user.id
  end
end
