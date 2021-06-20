require "rails_helper"

RSpec.describe PokemonsController do
  let!(:type_grass) { FactoryBot.create(:type) }
  let!(:type_poison) { FactoryBot.create(:type, name: 'poison') }
  let!(:pokemon) { FactoryBot.create(:pokemon, types: [type_grass, type_poison]) }

  describe "GET '#index'" do
    it "returns list of pokemons, each having :id, :name and :types" do
      get :index, { format: 'json' }

      expect(response.status).to be 200
      expect(JSON.parse(response.body)[0]).to be
      {
        "id"=>pokemon.id,
        "name"=>pokemon.name,
        "types"=>[
          {
            "id"=>type_grass.id,
            "name"=>type_grass.name
          },
          {
            "id"=>type_poison.id,
            "name"=>type_poison.name
          }
        ]
      }
    end
  end

  describe "GET '#show'" do
    it "returns specific pokemon details" do
      get :show, params: {id: pokemon.id, format: 'json'}

      expect(response.status).to be 200
      expect(JSON.parse(response.body)).to be
      {
        "id"=>pokemon.id,
        "name"=>pokemon.name,
        "height"=>pokemon.height,
        "weight"=>pokemon.weight,
        "types"=>[
          {
            "id"=>type_grass.id,
            "name"=>type_grass.name
          },
          {
            "id"=>type_poison.id,
            "name"=>type_poison.name
          }
        ]
      }
    end
  end
end
