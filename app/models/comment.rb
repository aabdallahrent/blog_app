class Comment < ApplicationRecord
  # got this line automatically when I added the references:articles
  # when creating this controller. have to do other side though as well (has_many on article)
  belongs_to :article
end
