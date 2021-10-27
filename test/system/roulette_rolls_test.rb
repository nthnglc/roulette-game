require "application_system_test_case"

class RouletteRollsTest < ApplicationSystemTestCase
  setup do
    @roulette_roll = roulette_rolls(:one)
  end

  test "visiting the index" do
    visit roulette_rolls_url
    assert_selector "h1", text: "Roulette Rolls"
  end

  test "creating a Roulette roll" do
    visit roulette_rolls_url
    click_on "New Roulette Roll"

    fill_in "Amount", with: @roulette_roll.amount
    fill_in "Color", with: @roulette_roll.color
    fill_in "Forecast", with: @roulette_roll.forecast
    fill_in "User", with: @roulette_roll.user
    click_on "Create Roulette roll"

    assert_text "Roulette roll was successfully created"
    click_on "Back"
  end

  test "updating a Roulette roll" do
    visit roulette_rolls_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @roulette_roll.amount
    fill_in "Color", with: @roulette_roll.color
    fill_in "Forecast", with: @roulette_roll.forecast
    fill_in "User", with: @roulette_roll.user
    click_on "Update Roulette roll"

    assert_text "Roulette roll was successfully updated"
    click_on "Back"
  end

  test "destroying a Roulette roll" do
    visit roulette_rolls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Roulette roll was successfully destroyed"
  end
end
