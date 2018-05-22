defmodule VcrWeb.RecommendationControllerTest do
  use VcrWeb.ConnCase

  alias Vcr.Recommendations

  @create_attrs %{availability: "some availability", description: "some description", energy: "some energy", name: "some name", noise: "some noise", price: "some price"}
  @update_attrs %{availability: "some updated availability", description: "some updated description", energy: "some updated energy", name: "some updated name", noise: "some updated noise", price: "some updated price"}
  @invalid_attrs %{availability: nil, description: nil, energy: nil, name: nil, noise: nil, price: nil}

  def fixture(:recommendation) do
    {:ok, recommendation} = Recommendations.create_recommendation(@create_attrs)
    recommendation
  end

  describe "index" do
    test "lists all recommendations", %{conn: conn} do
      conn = get conn, recommendation_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Recommendations"
    end
  end

  describe "new recommendation" do
    test "renders form", %{conn: conn} do
      conn = get conn, recommendation_path(conn, :new)
      assert html_response(conn, 200) =~ "New Recommendation"
    end
  end

  describe "create recommendation" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, recommendation_path(conn, :create), recommendation: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == recommendation_path(conn, :show, id)

      conn = get conn, recommendation_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Recommendation"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, recommendation_path(conn, :create), recommendation: @invalid_attrs
      assert html_response(conn, 200) =~ "New Recommendation"
    end
  end

  describe "edit recommendation" do
    setup [:create_recommendation]

    test "renders form for editing chosen recommendation", %{conn: conn, recommendation: recommendation} do
      conn = get conn, recommendation_path(conn, :edit, recommendation)
      assert html_response(conn, 200) =~ "Edit Recommendation"
    end
  end

  describe "update recommendation" do
    setup [:create_recommendation]

    test "redirects when data is valid", %{conn: conn, recommendation: recommendation} do
      conn = put conn, recommendation_path(conn, :update, recommendation), recommendation: @update_attrs
      assert redirected_to(conn) == recommendation_path(conn, :show, recommendation)

      conn = get conn, recommendation_path(conn, :show, recommendation)
      assert html_response(conn, 200) =~ "some updated availability"
    end

    test "renders errors when data is invalid", %{conn: conn, recommendation: recommendation} do
      conn = put conn, recommendation_path(conn, :update, recommendation), recommendation: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Recommendation"
    end
  end

  describe "delete recommendation" do
    setup [:create_recommendation]

    test "deletes chosen recommendation", %{conn: conn, recommendation: recommendation} do
      conn = delete conn, recommendation_path(conn, :delete, recommendation)
      assert redirected_to(conn) == recommendation_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, recommendation_path(conn, :show, recommendation)
      end
    end
  end

  defp create_recommendation(_) do
    recommendation = fixture(:recommendation)
    {:ok, recommendation: recommendation}
  end
end
