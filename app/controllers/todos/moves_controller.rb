class Todos::MovesController < ApplicationController
  before_action :set_todo

  def update
    @todo.insert_at(params[:index].to_i)
    head :ok
  end

  private

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end
end