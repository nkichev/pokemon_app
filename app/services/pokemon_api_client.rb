require 'faraday'

class PokemonApiClient
  class << self
    def make_request(method, path)
      Faraday.public_send(method, path)
    end
  end
end
