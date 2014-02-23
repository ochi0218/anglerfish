require 'test_helper'

class FishingLogsControllerTest < ActionController::TestCase
  setup do
    @fishing_log = fishing_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fishing_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fishing_log" do
    assert_difference('FishingLog.count') do
      post :create, fishing_log: { bait: @fishing_log.bait, comment: @fishing_log.comment, fish_length: @fishing_log.fish_length, fish_name: @fishing_log.fish_name, fish_weight: @fishing_log.fish_weight, fishing_date: @fishing_log.fishing_date, fishing_method: @fishing_log.fishing_method, fishing_point_name: @fishing_log.fishing_point_name, fishing_time: @fishing_log.fishing_time }
    end

    assert_redirected_to fishing_log_path(assigns(:fishing_log))
  end

  test "should show fishing_log" do
    get :show, id: @fishing_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fishing_log
    assert_response :success
  end

  test "should update fishing_log" do
    patch :update, id: @fishing_log, fishing_log: { bait: @fishing_log.bait, comment: @fishing_log.comment, fish_length: @fishing_log.fish_length, fish_name: @fishing_log.fish_name, fish_weight: @fishing_log.fish_weight, fishing_date: @fishing_log.fishing_date, fishing_method: @fishing_log.fishing_method, fishing_point_name: @fishing_log.fishing_point_name, fishing_time: @fishing_log.fishing_time }
    assert_redirected_to fishing_log_path(assigns(:fishing_log))
  end

  test "should destroy fishing_log" do
    assert_difference('FishingLog.count', -1) do
      delete :destroy, id: @fishing_log
    end

    assert_redirected_to fishing_logs_path
  end
end
