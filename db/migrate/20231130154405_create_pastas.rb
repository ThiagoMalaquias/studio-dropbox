class CreatePastas < ActiveRecord::Migration[7.1]
  def change
    create_table :pastas do |t|
      t.string :nome
      t.string :link
      t.references :origem, polymorphic: true, null: true

      t.timestamps
    end
  end
end
