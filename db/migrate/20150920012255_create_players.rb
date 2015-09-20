class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|

      t.string :first_sub
      t.string :last_sub
      t.string :submissions
      t.string :tried
      t.string :solved

      t.timestamps null: false
    end
  end
end
