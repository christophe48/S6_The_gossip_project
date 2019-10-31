class Gossip < ApplicationRecord
	#La relation est qu'un gossip est écrit pas un seul user
	belongs_to :user
	#mais qu'un gossip peut avoir plusieur tag
	has_many :tag_gossips
	has_many :tags, through: :tag_gossip

#Validation titre
	validates :title, presence: { message: "Le titre doit être renseigné"}

  validates :title, length: {minimum: 3, maximum: 14, message: "le titre doit etre compris entre 3 et 14 caracteres"}

	validates :title, uniqueness: { message: "Ce titre est déjà pris."}



#Validation contenu

validates :content, presence: { message: "le contenu doit être renseigné."}
validates :content, length: {minimum: 20, message: "Le contenu doit faire au moins 20 caracteres"}


end
