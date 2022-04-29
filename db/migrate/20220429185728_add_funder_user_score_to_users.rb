class AddFunderUserScoreToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :funder_user_score, :integer
  end
end
