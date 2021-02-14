class CreateParticipates < ActiveRecord::Migration[5.2]
  def change
    create_table :participates do |t|
      t.references :room, foreign_key: true
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
