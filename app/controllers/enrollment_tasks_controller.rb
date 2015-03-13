class EnrollmentTasksController < ApplicationController
  def create
    @task = Task.find params[:task_id]
    @task.enrollment_tasks.update_all status: 2
    @task.save
    redirect_to subject_path(params[:subject_id])
  end

  def update
    redirect_to subjects_path
  end
end