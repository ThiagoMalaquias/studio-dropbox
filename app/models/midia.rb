class Midia < ApplicationRecord
  has_one_attached :arquivo
  
  belongs_to :pasta
end
