class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.text :name
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
