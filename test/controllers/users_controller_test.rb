require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "can create a user" do
    assert_difference "User.count", 1 do
      post users_path, params: {
        user: {
          name: "John Doe",
          bio: "A really good programmer!",
          resume: "A graduate of the University of Life."
        }
      }
    end
  end

  test "edit a user" do
    user = users(:one)
    patch user_path(user), params: {
      user: {
        name: "Jane Doe",
        bio: "An even better programmer!",
        resume: "A graduate of the University of Hard Knocks."
      }
    }
    assert_redirected_to root_path
    user.reload
    assert_equal "Jane Doe", user.name
  end
end
