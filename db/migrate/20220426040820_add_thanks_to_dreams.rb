class AddThanksToDreams < ActiveRecord::Migration[6.1]
  def change
    add_column :dreams, :thanks, :string
  end
end
