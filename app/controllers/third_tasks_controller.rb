class ThirdTasksController < ApplicationController
  before_action :set_subtask
  before_action :set_third_task, only: %i[show edit update destroy done]

  def new
    @third_task = @subtask.third_tasks.new
  end

  def create
    @third_task = @subtask.third_tasks.new(third_task_params)
    if @third_task.save
      flash[:notice] = "サードタスクが作成されました！"
      redirect_to task_subtask_path(@subtask.task, @subtask)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @third_task.update(third_task_params)
      flash[:notice] = "サードタスクが更新されました！"
      redirect_to task_subtask_path(@subtask.task, @subtask)
    else
      render :edit
    end
  end

  def destroy
    @third_task.destroy
    flash[:notice] = "サードタスクが削除されました！"
    redirect_to task_subtask_path(@subtask.task, @subtask)
  end

  def show
  end

  def done
    if @third_task.done
      @third_task.update(done: false)
      flash[:notice] = "サードタスクが未完了に戻りました！"
    else
      @third_task.update(done: true)
      flash[:notice] = "サードタスクが完了しました！"
    end
    redirect_to task_subtask_path(@subtask.task, @subtask)
  end

  private

  def set_subtask
    @subtask = Subtask.find(params[:subtask_id])
  end

  def set_third_task
    @third_task = @subtask.third_tasks.find(params[:id])
  end

  def third_task_params
    params.require(:third_task).permit(:title, :body, :done)
  end
end
