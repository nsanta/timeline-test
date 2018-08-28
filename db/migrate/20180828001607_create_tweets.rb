class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :message, null: false, default: ''
      t.references :owner, foreign_key: { to_table: :users }
      t.timestamps
      t.index :created_at
    end
  end
end
