require "test_helper"

class MontagensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @montagem = montagens(:one)
  end

  test "should get index" do
    get montagens_url, as: :json
    assert_response :success
  end

  test "should create montagem" do
    assert_difference("Montagem.count") do
      post montagens_url, params: { montagem: { computador_pessoal_id: @montagem.computador_pessoal_id, usuario_id: @montagem.usuario_id } }, as: :json
    end

    assert_response :created
  end

  test "should show montagem" do
    get montagem_url(@montagem), as: :json
    assert_response :success
  end

  test "should update montagem" do
    patch montagem_url(@montagem), params: { montagem: { computador_pessoal_id: @montagem.computador_pessoal_id, usuario_id: @montagem.usuario_id } }, as: :json
    assert_response :success
  end

  test "should destroy montagem" do
    assert_difference("Montagem.count", -1) do
      delete montagem_url(@montagem), as: :json
    end

    assert_response :no_content
  end
end
