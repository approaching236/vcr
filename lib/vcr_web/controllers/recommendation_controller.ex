defmodule VcrWeb.RecommendationController do
  use VcrWeb, :controller

  alias Vcr.Recommendations
  alias Vcr.Recommendations.Recommendation

  def index(conn, _params) do
    recommendations = Recommendations.list_recommendations()
    render(conn, "index.html", recommendations: recommendations)
  end

  def new(conn, _params) do
    changeset = Recommendations.change_recommendation(%Recommendation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"recommendation" => recommendation_params}) do
    case Recommendations.create_recommendation(recommendation_params) do
      {:ok, recommendation} ->
        conn
        |> put_flash(:info, "Recommendation created successfully.")
        |> redirect(to: recommendation_path(conn, :show, recommendation))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    recommendation = Recommendations.get_recommendation!(id)
    render(conn, "show.html", recommendation: recommendation)
  end

  def edit(conn, %{"id" => id}) do
    recommendation = Recommendations.get_recommendation!(id)
    changeset = Recommendations.change_recommendation(recommendation)
    render(conn, "edit.html", recommendation: recommendation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "recommendation" => recommendation_params}) do
    recommendation = Recommendations.get_recommendation!(id)

    case Recommendations.update_recommendation(recommendation, recommendation_params) do
      {:ok, recommendation} ->
        conn
        |> put_flash(:info, "Recommendation updated successfully.")
        |> redirect(to: recommendation_path(conn, :show, recommendation))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", recommendation: recommendation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    recommendation = Recommendations.get_recommendation!(id)
    {:ok, _recommendation} = Recommendations.delete_recommendation(recommendation)

    conn
    |> put_flash(:info, "Recommendation deleted successfully.")
    |> redirect(to: recommendation_path(conn, :index))
  end
end
