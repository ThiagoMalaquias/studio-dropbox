class Midia < ApplicationRecord
  has_one_attached :arquivo
  
  belongs_to :pasta

  validate :acceptable_arquivo

  private

  def acceptable_arquivo
    return unless arquivo.attached?
  
    unless arquivo.blob.byte_size <= 100.megabyte
      errors.add(:arquivo, "Arquivo não pode ser enviado devido ao seu tamanho!")
    end
  end
end
