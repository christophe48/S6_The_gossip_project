class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:show,:new,:create,:edit,:update,:destroy]
  def index
    @gossip = Gossip.all
    @user = User.all
    @first_name = session[:first_name]
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = User.all
    @city = City.all
    @comment = Comment.all
  end

  def new
    @gossip = current_user
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    @gossip = Gossip.new(user_id: session[:user_id], title: params[:title], content: params[:content]) # avec xxx qui sont les données obtenues à partir du formulaire

    if @gossip.save # essaie de sauvegarder en base @gossip
      flash[:success] = "Le gossip a bien été répendu"
      redirect_to gossips_path
        else
      flash.now[:danger] = "Erreur, Gossip non crée"
      render 'gossips/new'# sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    @gossip = Gossip.find(params[:id])
  #j'applique la modif à moins que compare_user est faux (voir applicationController)
    unless compare_user(session[:user_id], @gossip.user_id) == false
      if @gossip.update(title: params[:title], content: params[:content])
        flash[:success] = "Le gossip a bien été modifié"
        redirect_to gossip_path(@gossip)
      else
        flash.now[:danger] = "Le gossip n'a pas été modifié"
        render :edit
      end
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    unless compare_user(session[:user_id], @gossip.user_id) == false
      if @gossip.destroy
        flash[:success] = "Le gossip a été supprimé"
          redirect_to gossips_path
      else
        render :show
      end
    end
  end
end
