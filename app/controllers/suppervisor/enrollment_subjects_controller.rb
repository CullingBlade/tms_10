class Suppervisor::EnrollmentSubjectsController < ::BaseSuppervisorController
  
  def create
    if params[:method] == '1'
      @course = Course.find params[:course_id]
      @course.start = Time.zone.now
      
      @course.enrollments.each do |enrollment|
        enrollment.status = 1
        @course.courses_subjects.each do |courses_subject|
          @course.enrollment_subjects.build enrollment: enrollment,
                                            user: enrollment.user, 
                                            courses_subject: courses_subject,
                                            subject: courses_subject.subject
        end
      end
      
      @course.save
      redirect_to suppervisor_course_path @course
    else
      @course = Course.find params[:course_id]
      @course.finish = Time.zone.now
      @course.enrollments.update_all status: 2
      @course.enrollment_subjects.update_all status: 2
      @course.subjects.each do |subject|
        subject.tasks.each do |task|
          task.enrollment_tasks.update_all status: 2
        end        
      end
      @course.save
      redirect_to suppervisor_course_path @course
    end
  end

  private
  def enrollment_subject_params
    params.require(:enrollment_subjects).permit :course_id, :way
  end
end