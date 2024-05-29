class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: %i[show edit update destroy done]

  def index
    @tasks = @user.tasks.where(done: false)
    @completed_tasks = @user.tasks.where(done: true)
  end

  def new
    @task = @user.tasks.new
  end

  def create
    @task = @user.tasks.new(task_params)
    if @task.save
      flash[:notice] = "タスク作成完了！がんばって！"
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "タスク削除！次行こう！"
    redirect_to tasks_path
  end

  def show
  end

  def done
    if @task.done
      @task.update(done: false)
      flash[:notice] = "もう一回頑張ろう！"
    else
      @task.update(done: true)
      flash[:notice] = "タスク完了だね！お疲れ様！"
    end
    redirect_to tasks_path
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def set_task
    @task = @user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :body, :done)
  end
end
