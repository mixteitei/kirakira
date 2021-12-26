class Point < ApplicationRecord
  belongs_to :user
  enum action: {log_in: 0, post_diary: 1, favorite: 2}
end
