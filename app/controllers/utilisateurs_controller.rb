class UtilisateursController < ApplicationController

  before_action :authenticate, :only => [:index,:edit,:update,:destroy]
  before_action :bon_utilisateur, only: [:edit,:update]

  def index
    @utilisateurs = Utilisateur.all
  end
  def new
    @page_name = 'sign up'
    @utilisateur = Utilisateur.new
  end
  def show
    @utilisateur = Utilisateur.find(params[:id])
    @articles = @utilisateur.articles
  end
  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.save
      flash[:success] = "welcome!"
      redirect_to @utilisateur
    else
      render 'new'
    end
  end
  private
  def utilisateur_params
    params.require(:utilisateur).permit(:nom,:email,:password,:password_confirmation)
  end

  def bon_utilisateur
    @utilisateur = Utilisateur.find { params[:id]  }
    redirect_to(home_path) unless @utilisateur == @utilisateur_courant
  end
  public
  def edit
    @utilisateur = Utilisateur.find(params[:id])
  end

  def update
    @utilisateur = Utilisateur.find(params[:id])
    if @utilisateur.update(utilisateur_params)
      flash[:success] = "Profile Actualised"
      redirect_to @utilisateur
    else
      render 'edit'
    end
  end

  def destroy
    Utilisateur.find(params[:id]).destroy
    flash[:success] = "Utilisateur deleted"
    redirect_to utilisateurs_path
  end


end
