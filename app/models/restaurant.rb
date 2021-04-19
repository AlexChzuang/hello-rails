class Restaurant < ApplicationRecord
  validates :title, presence: true

  default_scope { where(deleted_at: nil) }
  scope :available, -> { where(deleted_at: nil) }

  def self.deleted
    unscoped(:where).where.not(deleted_at: nil)
  end

  def destroy
    update(deleted_at: Time.now)
  end

  def really_destroy!
    super.destroy
  end

  # validates: email, presence: true, uniqueness: true
  #uniqueness 資料庫中的獨特性，只能有一個
end
