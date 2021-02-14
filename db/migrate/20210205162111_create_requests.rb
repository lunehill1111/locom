class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :account, foreign_key: true
      t.references :requested, foreign_key: { to_table: :accounts }
      t.boolean :status

      t.timestamps
      
      t.index [:account_id, :requested_id], unique: true
    end
  end
end
