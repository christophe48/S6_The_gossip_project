class AuthorController < ApplicationController

def index

end

def show
  @user = User.find(params[:id])
  @city = City.all
end

def new
  @user_create = User.new
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
  @user = current_user
end

def update
  @user = User.find(params[:id])
#j'applique la modif à moins que compare_user est faux (voir applicationController)
  unless compare_user(session[params[:user_id]], params[:user_id]) == false
    if @user.update(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], description: params[:description], password: :password_confirmation)
      redirect_to gossips_path
    else
      render :edit
    end
  end
end

def destroy
  # Méthode qui récupère le potin concerné et le détruit en base
  # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
end
end
