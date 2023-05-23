class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  # permet juste de générer le formulaire dans la view new (le html)
  def new
    @task = Task.new
    @placeholder_name = "task name"
    @placeholder_details = "details"
  end

  # permet de rentrer les input pour persister la db
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end
  # redirect_to task_path(@task) renvoie ici du coup l'id du resto en question. @task renvoie bien la page du bon id plus haut.

  def edit
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  # ici :task se réfère au model task
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
