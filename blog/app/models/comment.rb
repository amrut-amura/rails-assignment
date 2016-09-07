class Comment < ApplicationRecord
  belongs_to :article

   # validates_associated :article
end
