require "rails_helper"

RSpec.feature 'Pokemons pages', :type => :feature do
  let!(:type_grass) { FactoryBot.create(:type) }
  let!(:type_poison) { FactoryBot.create(:type, name: 'poison') }
  let!(:pokemon) { FactoryBot.create(:pokemon, types: [type_grass, type_poison]) }

  scenario 'User visits index page' do
    visit '/'

    expect(page).to have_text('Pokemon App')
    expect(page).to have_text('bulbasaur')
    expect(page).to have_text('Height')
    expect(page).to have_text('Weight')

    expect(page).to have_selector(:link_or_button, 'Show')

    first('.show_btn').click_link('Show')
    expect(page).to have_current_path("/pokemons/#{pokemon.id}")
  end

  scenario 'User visits show page' do
    visit "pokemons/#{pokemon.id}"

    expect(page).to have_text('Pokemon App')
    expect(page).to have_text('bulbasaur')
    expect(page).to have_text('Height')
    expect(page).to have_text('Weight')
  end
end
