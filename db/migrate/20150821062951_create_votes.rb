class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, default: 0, null: false
      t.integer :user_id, null: false
      t.integer :voteable_id, null: false
      t.string :voteable_type, null: false
      t.timestamps null: false
    end

    add_index :votes, :user_id
    add_index :votes, [:voteable_id, :voteable_type]
  end
end
