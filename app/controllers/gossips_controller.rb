class GossipsController < ApplicationController

  def index
    @gossip = Gossip.all
    @user = User.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = User.all
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    @gossip = Gossip.new(user_id: 1, title: params[:title], content: params[:content]) # avec xxx qui sont les données obtenues à partir du formulaire

    if @gossip.save # essaie de sauvegarder en base @gossip
      redirect_to gossips_path
    else
      render 'gossips/new'# sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    @gossipp = Gossip.find(params[:id])
    if @gossipp.update(title: params[:title], content: params[:content], user_id: 1)
      redirect_to gossips_path
    else
      render :edit
    end
  end

  def destroy
    @gossipp = Gossip.find(params[:id])
    if @gossipp.destroy
        redirect_to gossips_path
    else
      render :show
    end
  end
end
