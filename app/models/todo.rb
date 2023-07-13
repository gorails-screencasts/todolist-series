class Todo < ApplicationRecord
  acts_as_list top_of_list: 0, add_new_to: :top

  scope :by_position, -> { order(position: :asc) }
  scope :complete, -> { where.not(completed_at: nil) }
  scope :incomplete, -> { where(completed_at: nil) }

  validates :title, presence: true

  def complete?
    completed_at?
  end

  def incomplete?
    !complete?
  end

  def toggle
    completed_at = (completed_at? ? nil : Time.current)
    position = Todo.incomplete.maximum(:position)

    # If it's already completed, add after the incomplete items
    # If it's not complete, we don't need to add 1, because
    # we're removing this item from the incomplete list
    position += 1 if completed_at?

    update(completed_at: completed_at, position: position)
  end
end
