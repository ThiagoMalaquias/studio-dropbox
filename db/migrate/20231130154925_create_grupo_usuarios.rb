class CreateGrupoUsuarios < ActiveRecord::Migration[7.1]
  def change
    create_table :grupo_usuarios do |t|
      t.references :grupo, null: false, foreign_key: true
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
