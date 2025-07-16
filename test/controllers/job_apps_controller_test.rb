require "test_helper"

class JobAppsControllerTest < ActionDispatch::IntegrationTest
  test "can create a job application" do
    assert_difference "JobApp.count", 1 do
      user = users(:one)
      post user_job_apps_path(user), params: {
        job_app: {
          company_name: "AcmeCorp",
          title: "Software Engineer",
          description: "Developing cutting-edge software solutions."
        }
      }
      assert_equal user.job_apps.count, 3
      assert_redirected_to root_path
    end
  end

  test "can destroy a job application" do
    user = users(:one)
    job_app = job_apps(:one)

    assert_equal 2, user.job_apps.count

    assert_difference "JobApp.count", -1 do
      delete job_app_path(job_app)
    end
    assert_equal 1, user.reload.job_apps.count
  end

  test "can get index of job applications" do
    get user_job_apps_path(users(:one))
    assert_response :success
  end

  test "can get new job application page" do
    get new_user_job_app_path(users(:one))
    assert_response :success
  end
end
