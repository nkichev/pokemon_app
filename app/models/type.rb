class Type < ApplicationRecord
  has_and_belongs_to_many :pokemons  # normally would use a join model, but for the sake of simplicity will go this way
end
