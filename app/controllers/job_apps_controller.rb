class JobAppsController < ApplicationController
  before_action :grab_user
  def index
  end

  def new
    @job_app = @user.job_apps.new
  end

  def create
    @job_app = @user.job_apps.new(job_params)
    if @job_app.save
      redirect_to root_path, notice: "Job Application was successfully created."
    else
      render :new
    end
  end

  def show
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
