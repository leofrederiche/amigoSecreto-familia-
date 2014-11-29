class CreateFamilia < ActiveRecord::Migration
  def change
    create_table :familia do |t|
      t.string :name

      t.timestamps
    end
  end
end
