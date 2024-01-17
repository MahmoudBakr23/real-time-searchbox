class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.text :text_query
      t.string :user_ip
      t.references :article, null: true, foreign_key: true

      t.timestamps
    end
  end
end
