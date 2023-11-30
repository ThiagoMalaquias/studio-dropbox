require "test_helper"

class PastasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pasta = pastas(:one)
  end

  test "should get index" do
    get pastas_url
    assert_response :success
  end

  test "should get new" do
    get new_pasta_url
    assert_response :success
  end

  test "should create pasta" do
    assert_difference("Pasta.count") do
      post pastas_url, params: { pasta: { link: @pasta.link, nome: @pasta.nome, origem_id: @pasta.origem_id, origem_type: @pasta.origem_type } }
    end

    assert_redirected_to pasta_url(Pasta.last)
  end

  test "should show pasta" do
    get pasta_url(@pasta)
    assert_response :success
  end

  test "should get edit" do
    get edit_pasta_url(@pasta)
    assert_response :success
  end

  test "should update pasta" do
    patch pasta_url(@pasta), params: { pasta: { link: @pasta.link, nome: @pasta.nome, origem_id: @pasta.origem_id, origem_type: @pasta.origem_type } }
    assert_redirected_to pasta_url(@pasta)
  end

  test "should destroy pasta" do
    assert_difference("Pasta.count", -1) do
      delete pasta_url(@pasta)
    end

    assert_redirected_to pastas_url
  end
end
