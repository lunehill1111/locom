class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :prefecture
      t.string :city
      t.string :place
      t.string :building

      t.timestamps
    end
  end
end
