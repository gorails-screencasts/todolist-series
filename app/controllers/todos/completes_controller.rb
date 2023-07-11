class Todos::CompletesController < ApplicationController
  before_action :set_todo

  def update
    @todo.toggle
    redirect_to root_path
  end

  private

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end
end