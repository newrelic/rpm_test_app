require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, :blog_id => blogs(:one)
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new, :blog_id => blogs(:one)
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, :post => { }, :blog_id => blogs(:one)
    end

    assert_redirected_to blog_path(assigns(:blog))
  end

  test "should show post" do
    get :show, :id => posts(:one).id, :blog_id => blogs(:one)
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => posts(:one).id, :blog_id => blogs(:one)
    assert_response :success
  end

  test "should update post" do
    put :update, :id => posts(:one).id, :post => { }, :blog_id => blogs(:one)
    assert_redirected_to blog_post_path(assigns(:blog), assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, :id => posts(:one).id, :blog_id => blogs(:one)
    end

    assert_redirected_to blog_posts_path(assigns(:blog))
  end
end
