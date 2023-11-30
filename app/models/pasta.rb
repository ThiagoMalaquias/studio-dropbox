class Pasta < ApplicationRecord
  belongs_to :origem, polymorphic: true, optional: true

  has_many :pasta_grupos, dependent: :destroy
  has_many :midias, dependent: :destroy
  has_many :grupos, through: :grupo_usuarios

  accepts_nested_attributes_for :pasta_grupos, allow_destroy: true, update_only: false


  def todas_pastas
    Pasta.where(origem_id: id)
  end
end
