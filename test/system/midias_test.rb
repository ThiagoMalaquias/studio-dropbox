require "application_system_test_case"

class MidiasTest < ApplicationSystemTestCase
  setup do
    @midia = midias(:one)
  end

  test "visiting the index" do
    visit midias_url
    assert_selector "h1", text: "Midias"
  end

  test "should create midia" do
    visit midias_url
    click_on "New midia"

    fill_in "Arquivo", with: @midia.arquivo
    fill_in "Pasta", with: @midia.pasta_id
    click_on "Create Midia"

    assert_text "Midia was successfully created"
    click_on "Back"
  end

  test "should update Midia" do
    visit midia_url(@midia)
    click_on "Edit this midia", match: :first

    fill_in "Arquivo", with: @midia.arquivo
    fill_in "Pasta", with: @midia.pasta_id
    click_on "Update Midia"

    assert_text "Midia was successfully updated"
    click_on "Back"
  end

  test "should destroy Midia" do
    visit midia_url(@midia)
    click_on "Destroy this midia", match: :first

    assert_text "Midia was successfully destroyed"
  end
end
