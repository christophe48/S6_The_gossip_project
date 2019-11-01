class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

  def index
  end

  def show
  end

  def new
  end

  def create
    @comment = Comment.new(content: params[:content], user: current_user, gossip: Gossip.find(params[:gossip_id]))
    puts params.inspect
    if @comment.save
      flash[:success] = "Commentaire ajouté !"
      redirect_to gossip_path(params[:gossip_id])
    else
      render :new
      puts @comment.errors.messages
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
  #j'applique la modif à moins que compare_user est faux (voir applicationController)
    unless compare_user(session[:user_id], @comment.user_id) == false
      if @comment.update(content: params[:content], user: current_user, gossip: Gossip.find(params[:gossip_id]))
        flash[:success] = "Le commentaire a bien été modifié"
        redirect_to gossip_path(params[:gossip_id])
      else
        flash.now[:danger] = "Le commentaire n'a pas été modifié"
        render :edit
      end
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    unless compare_user(session[:user_id], @gossip.user_id) == false
      if @gossip.destroy
        flash[:success] = "Le gossip a été supprimé"
          redirect_to gossip_path(params[:gossip_id])
      else
        render :show
      end
    end
  end
end
