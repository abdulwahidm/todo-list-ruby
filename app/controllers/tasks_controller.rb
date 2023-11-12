class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
  
    def index
      @tasks = Task.all
    end
  
    def show
      # Tampilkan detail tugas dengan id yang diberikan
    end
  
    def new
      @task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
  
      if @task.save
        redirect_to tasks_path, notice: 'Tugas berhasil dibuat.'
      else
        render :new
      end
    end
  
    def edit
      # Form untuk mengedit tugas
    end
  
    def update
      if @task.update(task_params)
        redirect_to tasks_path, notice: 'Tugas berhasil diperbarui.'
      else
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to tasks_path, notice: 'Tugas berhasil dihapus.'
    end
  
    private
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:title, :description, :due_date, :completed)
    end
  end
  