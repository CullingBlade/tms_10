class SubjectsController < ApplicationController
  before_action :logged_in_user
  before_action :current_subject, only: [:show, :edit, :destroy, :update] 

  def index
    @subjects = current_user.subjects.all
    @tasks = Task.all
  end

  def show
    @tasks = @subject.tasks
  end

  def new
    @subject = current_user.subjects.new
    @tasks = @subject.tasks.build
  end

  def edit
  end

  def create
    @subject = current_user.subjects.new subject_params
    if @subject.save
      flash[:success] = "Subject created"
      redirect_to subjects_url
    else
      render :new
    end
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = "Successfully updated"
      redirect_to @subject
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    flash[:success] = "Subject is destroyed."
    redirect_to subjects_url
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :description,
     tasks_attributes: [:name, :id, :_destroy])
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def current_subject
    @subject = Subject.find params[:id]
  end
end