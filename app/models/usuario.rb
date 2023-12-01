class Usuario < ApplicationRecord
  has_many :grupo_usuarios, dependent: :destroy
  has_many :grupos, through: :grupo_usuarios


  def pastas
    pastas_sem_grupos = Pasta.left_outer_joins(:pasta_grupos).where(pasta_grupos: { grupo_id: nil }).pluck(:id)
    pastas_pertencentes_ao_usuario = Pasta.distinct.joins(:pasta_grupos).where(pasta_grupos: { grupo_id: grupos.pluck(:id) }).pluck(:id)
    Pasta.distinct.where(id: [pastas_sem_grupos, pastas_pertencentes_ao_usuario].flatten)
  end
end
