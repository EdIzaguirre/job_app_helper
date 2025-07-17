class JobAppsController < ApplicationController
  before_action :grab_user
  def index
    render Views::JobApps::Index.new(user: @user)
  end

  def new
    @job_app = @user.job_apps.new
    render Views::JobApps::New.new(user: @user, job_app: @job_app)
  end

  def create
    @job_app = @user.job_apps.new(job_params)
    if @job_app.save
      redirect_to root_path, notice: "Job Application was successfully created."
    else
      render Views::JobApps::New.new(user: @user, job_app: @job_app)
    end
  end

  def edit
    @job_app = @user.job_apps.find(params[:id])
    render Views::JobApps::Edit.new(job_app: @job_app)
  end

  def update
    @job_app = @user.job_apps.find(params[:id])
    if @job_app.update(job_params)
      redirect_to root_path, notice: "Job Application updated successfully"
    else
      render Views::JobApps::Edit.new(job_app: @job_app), status: :unprocessable_entity
    end
  end

  def destroy
    @job_app = @user.job_apps.find(params[:id])
    @job_app.destroy
    redirect_to root_path, notice: "Job Application was successfully deleted."
  end

  def show
   @job_app = @user.job_apps.find(params[:id])
   render Views::JobApps::Show.new(job_app: @job_app)
  end

  private

  def grab_user
    if User.exists?
      @user = User.first
    else
      redirect_to new_user_path
    end
  end

  def job_params
    params.expect(job_app: [ :company_name, :title, :description ])
  end
end
