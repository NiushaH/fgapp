class CreateDreams < ActiveRecord::Migration[6.1]
  def change
    create_table :dreams do |t|
      t.string :name
      t.integer :cost
      t.integer :dreamer_user_id
      t.integer :funder_user_id

      t.timestamps
    end
  end
end
