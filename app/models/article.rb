class Article < ApplicationRecord
  # in rails models are singular, thats why its called Article here.
  # when we generated this, it also created a migration.

  # we get validates because we inherit from ApplicationRecord which inherits from ActiveRecord::Base
  validates :title, presence: true,
                  length: { minimum: 5 }
end
