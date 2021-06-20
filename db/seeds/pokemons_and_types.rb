# Populating application pokemons and types via external API

directory_name = "#{Rails.root}/tmp/images"
Dir.mkdir directory_name unless File.exists?(directory_name)

(1..12).each do |id|
  pokemon = JSON.parse(PokemonApiClient.make_request(:get, "https://pokeapi.co/api/v2/pokemon/#{id}").body)
  types = []
  pokemon['types'].each { |type| types << type['type']['name'] }

  avatar_response = PokemonApiClient.make_request(:get, "#{pokemon['sprites']['front_shiny']}").body

  pokemon_name = pokemon['name']
  image_path = File.join('tmp/images', "#{pokemon_name}.png")
  File.open(image_path, 'wb') { |fp| fp.write(avatar_response) }

  new_pokemon = Pokemon.find_or_create_by(
    name: pokemon_name,
    height: pokemon['height'],
    weight: pokemon['weight']
  )
  new_pokemon.avatar.attach(
    io: File.open("tmp/images/#{pokemon_name}.png"),
    filename: "#{pokemon_name}.png",
    content_type: 'image/png'
  )

  types.each do |type|
    new_type = Type.find_or_create_by(name: type)
    new_pokemon.types << new_type unless new_pokemon.types.include? new_type
  end
end
