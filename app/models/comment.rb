class Comment < ApplicationRecord
  #je fais mes conditions
  validates :content,  presence: { message: "Le commentaire doit être renseigné"}

  #un commentaire peut avoir qu'un seul auteur et être sur un seul gossip
  belongs_to :user
  belongs_to :gossip
end
