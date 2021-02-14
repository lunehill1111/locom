class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true
      t.boolean :administratible

      t.timestamps
    end
  end
end
