class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.includes(:types, avatar_attachment: :blob).all

    respond_to do |format|
      format.html
      format.json {
        render json: @pokemons.to_json(
          :only => [:id, :name, :types],
          :include => {
            :types => {only: [:id, :name]}
          })
       }
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @pokemon.to_json(include: [:types, :avatar_attachment]) }
    end
  end
end
