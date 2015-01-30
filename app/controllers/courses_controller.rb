class CoursesController < ApplicationController
  before_action :logged_in_user
  before_action :current_course,  only: [:show, :edit, :destroy, :update] 

  def index
    @courses = Course.all
  end

  def show
    @course = current_course
    @subjects = Subject.all
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = current_user.courses.build course_params
    if @course.save
      flash[:success] = "Course created"
      redirect_to courses_url
    end
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = "Successfully updated"
      redirect_to @course
    else
      render "edit"
    end
  end

  def destroy
    @course.destroy
    flash[:success] = "Course destroyed."
    redirect_to courses_url
  end

  private
  def course_params
    params.require(:course).permit :name, :description
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def current_course
    @course = Course.find params[:id]
  end
end