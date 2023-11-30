class Pasta < ApplicationRecord
  belongs_to :origem, polymorphic: true
end
