class CreateGrupos < ActiveRecord::Migration[7.1]
  def change
    create_table :grupos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
