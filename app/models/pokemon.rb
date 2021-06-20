class Pokemon < ApplicationRecord
  has_one_attached :avatar
  has_and_belongs_to_many :types # normally would use a join model, but for the sake of simplicity will go this way
end
