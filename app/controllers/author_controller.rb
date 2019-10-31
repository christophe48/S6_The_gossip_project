class AuthorController < ApplicationController

def index

end

def show
  @user = User.find(params[:id])
  @city = City.all
end

def new
  # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
end

def create
    nb = rand(1..10)
    @user_create = User.new(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], city_id: nb, email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], description: params[:description])
    if @user_create.save
      log_in(@user_create)
      redirect_to gossips_path
    else
      render :new
    end
end

def edit
  # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
end

def update
  # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
  # pour info, le contenu de ce formulaire sera accessible dans le hash params
  # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
end

def destroy
  # Méthode qui récupère le potin concerné et le détruit en base
  # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
end
end
