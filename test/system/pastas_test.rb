require "application_system_test_case"

class PastasTest < ApplicationSystemTestCase
  setup do
    @pasta = pastas(:one)
  end

  test "visiting the index" do
    visit pastas_url
    assert_selector "h1", text: "Pastas"
  end

  test "should create pasta" do
    visit pastas_url
    click_on "New pasta"

    fill_in "Link", with: @pasta.link
    fill_in "Nome", with: @pasta.nome
    fill_in "Origem", with: @pasta.origem_id
    fill_in "Origem type", with: @pasta.origem_type
    click_on "Create Pasta"

    assert_text "Pasta was successfully created"
    click_on "Back"
  end

  test "should update Pasta" do
    visit pasta_url(@pasta)
    click_on "Edit this pasta", match: :first

    fill_in "Link", with: @pasta.link
    fill_in "Nome", with: @pasta.nome
    fill_in "Origem", with: @pasta.origem_id
    fill_in "Origem type", with: @pasta.origem_type
    click_on "Update Pasta"

    assert_text "Pasta was successfully updated"
    click_on "Back"
  end

  test "should destroy Pasta" do
    visit pasta_url(@pasta)
    click_on "Destroy this pasta", match: :first

    assert_text "Pasta was successfully destroyed"
  end
end
