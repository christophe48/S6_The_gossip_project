class SessionsController < ApplicationController

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
  # cherche s'il existe un utilisateur en base avec l’e-mail
  user = User.find_by(email: params[:email])

  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if user && user.authenticate(params[:password])
      log_in(user)
      flash[:success] = "Vous êtes bien connecté"
    redirect_to gossips_path# redirige où tu veux, avec un flash ou pas
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    if session.delete(:user_id)
      redirect_to gossips_path
    end
  end

end
