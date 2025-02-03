crumb :root do
  link "Home", root_path
end

crumb :tasks do
  link "タスク一覧", tasks_path
  parent :root
end

crumb :task do |task|
  link task.title, task_path(task)
  parent :tasks
end

crumb :new_task do
  link "新規作成", new_task_path
  parent :tasks
end

crumb :edit_task do |task|
  link "編集", edit_task_path(task)
  parent :task, task
end

crumb :subtask do |subtask|
  link subtask.title, task_subtask_path(subtask.task, subtask)
  parent :task, subtask.task
end

crumb :new_subtask do |task|
  link "新規サブタスク作成", new_task_subtask_path(task)
  parent :task, task
end

crumb :edit_subtask do |subtask|
  link "編集", edit_task_subtask_path(subtask.task, subtask)
  parent :subtask, subtask
end

crumb :third_task do |third_task|
  link third_task.title, task_subtask_third_task_path(third_task.subtask.task, third_task.subtask, third_task)
  parent :subtask, third_task.subtask
end

crumb :new_third_task do |subtask|
  link "新規サードタスク作成", new_task_subtask_third_task_path(subtask)
  parent :subtask, subtask
end

crumb :edit_third_task do |third_task|
  link "編集", edit_task_subtask_third_task_path(third_task.subtask, third_task)
  parent :third_task, third_task
end

