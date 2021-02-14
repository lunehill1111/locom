class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :room, foreign_key: true
      t.references :account, foreign_key: true
      t.string :context
      t.string :picture_url

      t.timestamps
    end
  end
end
