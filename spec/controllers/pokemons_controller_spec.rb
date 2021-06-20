require "rails_helper"

RSpec.describe PokemonsController do
  describe "GET '#index'" do
    it "returns list of pokemons, each having :id, :name and :types" do
      get :index, { format: 'json' }

      expect(response.status).to be 200
      expect(JSON.parse(response.body)[0]).to be
      {
        "id"=>1,
        "name"=>"bulbasaur",
        "types"=>[
          {
            "id"=>1,
            "name"=>"grass"
          },
          {
            "id"=>2,
            "name"=>"poison"
          }
        ]
      }
    end
  end

  describe "GET '#show'" do
    it "returns specific pokemon details" do
      get :show, params: {id: 1, format: 'json'}

      expect(response.status).to be 200
      expect(JSON.parse(response.body)).to be
      {
        "id"=>1,
        "name"=>"bulbasaur",
        "height"=>7,
        "weight"=>69,
        "types"=>[
          {
            "id"=>1,
            "name"=>"grass"
          },
          {
            "id"=>2,
            "name"=>"poison"
          }
        ],
        "avatar_attachment"=>{
          "id"=>1,
          "name"=>"avatar",
          "record_type"=>"Pokemon",
          "record_id"=>1,
          "blob_id"=>1,
        }
      }
    end
  end
end
