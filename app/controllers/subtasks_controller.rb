# frozen_string_literal: true

class SubtasksController < ApplicationController
  before_action :set_task
  before_action :set_subtask, only: %i[show edit update destroy done]

  def index
    @subtasks = @task.subtasks.where(done: false)
    @completed_subtasks = @task.subtasks.where(done: true)
  end

  def show
    @third_tasks = @subtask.third_tasks.where(done: false)
    @completed_third_tasks = @subtask.third_tasks.where(done: true)
  end

  def new
    @subtask = @task.subtasks.new
  end

  def edit; end

  def create
    @subtask = @task.subtasks.new(subtask_params)
    if @subtask.save
      flash[:notice] = 'タスク作成したよ！がんばろ！'
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def update
    if @subtask.update(subtask_params)
      flash[:notice] = 'タスクを更新したよ！がんばろ！'
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @subtask.destroy
    flash[:notice] = 'タスクを削除したよ！'
    redirect_to task_path(@task)
  end

  def done
    if @subtask.done
      @subtask.update(done: false)
      flash[:notice] = 'もう一回頑張ろう！'
    else
      @subtask.update(done: true)
      flash[:notice] = 'タスク完了だね！！'
    end
    redirect_to task_path(@task)
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_subtask
    @subtask = @task.subtasks.find(params[:id])
  end

  def subtask_params
    params.require(:subtask).permit(:title, :body, :done)
  end
end
