require "rails_helper"

RSpec.feature 'Pokemons pages', :type => :feature do
  scenario 'User visits index page' do
    visit '/'

    expect(page).to have_text('Pokemon App')
    expect(page).to have_text('bulbasaur')
    expect(page).to have_text('Height')
    expect(page).to have_text('Weight')

    expect(page).to have_selector(:link_or_button, 'Show')

    first('.show_btn').click_link('Show')
    expect(page).to have_current_path('/pokemons/1')
  end

  scenario 'User visits show page' do
    visit '/pokemons/1'

    expect(page).to have_text('Pokemon App')
    expect(page).to have_text('bulbasaur')
    expect(page).to have_text('Height')
    expect(page).to have_text('Weight')
  end
end
