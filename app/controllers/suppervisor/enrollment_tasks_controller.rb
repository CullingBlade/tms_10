class Suppervisor::EnrollmentTasksController < ::BaseSuppervisorController

  def create
    @course = Course.find params[:course_id]
    @subject = Subject.find params[:subject_id]
    @user = User.find params[:user_id]
    @subject.enrollment_subjects.each do |enrollment_subject|
      if enrollment_subject.user_id == @user.id
        if params[:flag] == '1'
          @subject.tasks.each do |task|
            @enrollment_task = task.enrollment_tasks.build subject_id: params[:subject_id], 
                                                                      enrollment_subject_id: params[:enrollment_subject_id], 
                                                                      user_id: params[:user_id],
                                                                      status: 1
            @enrollment_task.save
          end
        else
          @subject.tasks.each do |task|
            task.enrollment_tasks.where(user_id: @user.id).update_all status: params[:flag]
          end
        end
        enrollment_subject.update status: params[:flag]
      end
    end
    @subject.save
    redirect_to suppervisor_course_path @course
  end
end