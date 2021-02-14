class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :segment_name
      t.string :prefecture
      t.string :city
      t.string :place
      t.string :building

      t.timestamps
    end
  end
end
