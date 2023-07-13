class AddPositionToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :position, :integer

    Todo.find_each.with_index do |todo, index|
      todo.update_column :position, index
    end
  end
end
