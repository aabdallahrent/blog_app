class Article < ApplicationRecord
  # in rails models are singular, thats why its called Article here.
  # when we generated this, it also created a migration.

  has_many :comments, dependent: :destroy # establish this side of the relationship. I already specified the other FK when creating it with: rails generate model Comment commenter:string body:text article:references
  # that dependent destroy bit is there to state remove these comments if the article is deleted.
  # we get validates because we inherit from ApplicationRecord which inherits from ActiveRecord::Base
  validates :title, presence: true,
                  length: { minimum: 5 }
end
