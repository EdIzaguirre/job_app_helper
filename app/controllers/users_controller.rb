class UsersController < ApplicationController
  before_action :grab_user, except: [ :new, :create ]
  def new
    @user = User.new
    render Views::Users::New.new(user: @user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "User was successfully created."
    else
      render :new
    end
  end

  def edit
    render Views::Users::Edit.new(user: @user)
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "User updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.expect(user: [ :name, :bio, :resume ])
  end

  def grab_user
    if User.exists?
      @user = User.first
    else
      redirect_to new_user_path
    end
  end
end
