class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = '正常に処理されました！'
      redirect_to @task
    else
      flash[:danger] = '失敗しました…'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = '正常に処理されました！'
      redirect_to @task
    else
      flash[:danger] = '失敗しました…'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:success] = '正常に処理されました！'
      redirect_to tasks_url
    else
      flash[:danger] = '失敗しました…'
      render :new
    end
  end

  private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
