class Restaurant < ApplicationRecord
  validates :title, presence: true

  # validates: title, presence: true
  # validates: email, presence: true, uniqueness: true
  #uniqueness 資料庫中的獨特性，只能有一個
end
