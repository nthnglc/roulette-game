require "test_helper"

class RouletteRollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @roulette_roll = roulette_rolls(:one)
  end

  test "should get index" do
    get roulette_rolls_url
    assert_response :success
  end

  test "should get new" do
    get new_roulette_roll_url
    assert_response :success
  end

  test "should create roulette_roll" do
    assert_difference('RouletteRoll.count') do
      post roulette_rolls_url, params: { roulette_roll: { amount: @roulette_roll.amount, color: @roulette_roll.color, forecast: @roulette_roll.forecast, user: @roulette_roll.user } }
    end

    assert_redirected_to roulette_roll_url(RouletteRoll.last)
  end

  test "should show roulette_roll" do
    get roulette_roll_url(@roulette_roll)
    assert_response :success
  end

  test "should get edit" do
    get edit_roulette_roll_url(@roulette_roll)
    assert_response :success
  end

  test "should update roulette_roll" do
    patch roulette_roll_url(@roulette_roll), params: { roulette_roll: { amount: @roulette_roll.amount, color: @roulette_roll.color, forecast: @roulette_roll.forecast, user: @roulette_roll.user } }
    assert_redirected_to roulette_roll_url(@roulette_roll)
  end

  test "should destroy roulette_roll" do
    assert_difference('RouletteRoll.count', -1) do
      delete roulette_roll_url(@roulette_roll)
    end

    assert_redirected_to roulette_rolls_url
  end
end
