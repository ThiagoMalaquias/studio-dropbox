class GrupoUsuario < ApplicationRecord
  belongs_to :grupo
  belongs_to :usuario
end
