class Todo < ApplicationRecord
  validates :title, presence: true

  scope :by_completion, -> { order(completed_at: :desc) }

  def toggle
    update(completed_at: (completed_at? ? nil : Time.current))
  end
end
