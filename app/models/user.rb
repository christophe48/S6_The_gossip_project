class User < ApplicationRecord
	#j'effectue ma relation: 1 utilisateur appartient à 1 ville
	belongs_to :city
	#l'utilisateur peut avoir écrit plusieur gossips
	has_many :gossips
	#qu'un user peut envoyer plusieur message et recevoir plusieur message
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "MessagePrive"
	has_many :received_messages, foreign_key: 'recipient_id', class_name: "MessagePrive"
	#un user peut écrire plusieur commentaires
	has_many :comments
	
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	validates :first_name, presence: {message: "Le prenom doit être renseigné !"}
	validates :last_name, presence:  {message: "Le nom doit être renseigné !"}
	validates :description, presence: {message: "La description doit être renseigné !"}
	validates :email, uniqueness: {message: "l'email est deja pris !"}
	validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "L'email doit être renseigné au bon format (email@eamil.email) !"}
end
