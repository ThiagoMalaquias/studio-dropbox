class CreatePastaGrupos < ActiveRecord::Migration[7.1]
  def change
    create_table :pasta_grupos do |t|
      t.references :pasta, null: false, foreign_key: true
      t.references :grupo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
