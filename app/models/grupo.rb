class Grupo < ApplicationRecord
  has_many :grupo_usuarios, dependent: :destroy
  has_many :usuarios, through: :grupo_usuarios

  has_many :pasta_grupos, dependent: :destroy
  has_many :pastas, through: :pasta_grupos

  accepts_nested_attributes_for :grupo_usuarios, allow_destroy: true, update_only: false
end
