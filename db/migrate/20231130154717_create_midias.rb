class CreateMidias < ActiveRecord::Migration[7.1]
  def change
    create_table :midias do |t|
      t.text :arquivo
      t.references :pasta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
