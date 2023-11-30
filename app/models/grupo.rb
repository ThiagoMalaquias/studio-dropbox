class Grupo < ApplicationRecord
  has_many :grupo_usuarios, dependent: :destroy
  has_many :usuarios, through: :grupo_usuarios

  accepts_nested_attributes_for :grupo_usuarios, allow_destroy: true, update_only: false
end
