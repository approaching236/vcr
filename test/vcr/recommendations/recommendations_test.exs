defmodule Vcr.RecommendationsTest do
  use Vcr.DataCase

  alias Vcr.Recommendations

  describe "recommendations" do
    alias Vcr.Recommendations.Recommendation

    @valid_attrs %{availability: "some availability", description: "some description", energy: "some energy", name: "some name", noise: "some noise", price: "some price"}
    @update_attrs %{availability: "some updated availability", description: "some updated description", energy: "some updated energy", name: "some updated name", noise: "some updated noise", price: "some updated price"}
    @invalid_attrs %{availability: nil, description: nil, energy: nil, name: nil, noise: nil, price: nil}

    def recommendation_fixture(attrs \\ %{}) do
      {:ok, recommendation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Recommendations.create_recommendation()

      recommendation
    end

    test "list_recommendations/0 returns all recommendations" do
      recommendation = recommendation_fixture()
      assert Recommendations.list_recommendations() == [recommendation]
    end

    test "get_recommendation!/1 returns the recommendation with given id" do
      recommendation = recommendation_fixture()
      assert Recommendations.get_recommendation!(recommendation.id) == recommendation
    end

    test "create_recommendation/1 with valid data creates a recommendation" do
      assert {:ok, %Recommendation{} = recommendation} = Recommendations.create_recommendation(@valid_attrs)
      assert recommendation.availability == "some availability"
      assert recommendation.description == "some description"
      assert recommendation.energy == "some energy"
      assert recommendation.name == "some name"
      assert recommendation.noise == "some noise"
      assert recommendation.price == "some price"
    end

    test "create_recommendation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recommendations.create_recommendation(@invalid_attrs)
    end

    test "update_recommendation/2 with valid data updates the recommendation" do
      recommendation = recommendation_fixture()
      assert {:ok, recommendation} = Recommendations.update_recommendation(recommendation, @update_attrs)
      assert %Recommendation{} = recommendation
      assert recommendation.availability == "some updated availability"
      assert recommendation.description == "some updated description"
      assert recommendation.energy == "some updated energy"
      assert recommendation.name == "some updated name"
      assert recommendation.noise == "some updated noise"
      assert recommendation.price == "some updated price"
    end

    test "update_recommendation/2 with invalid data returns error changeset" do
      recommendation = recommendation_fixture()
      assert {:error, %Ecto.Changeset{}} = Recommendations.update_recommendation(recommendation, @invalid_attrs)
      assert recommendation == Recommendations.get_recommendation!(recommendation.id)
    end

    test "delete_recommendation/1 deletes the recommendation" do
      recommendation = recommendation_fixture()
      assert {:ok, %Recommendation{}} = Recommendations.delete_recommendation(recommendation)
      assert_raise Ecto.NoResultsError, fn -> Recommendations.get_recommendation!(recommendation.id) end
    end

    test "change_recommendation/1 returns a recommendation changeset" do
      recommendation = recommendation_fixture()
      assert %Ecto.Changeset{} = Recommendations.change_recommendation(recommendation)
    end
  end
end
