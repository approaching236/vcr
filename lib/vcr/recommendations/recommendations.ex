defmodule Vcr.Recommendations do
  @moduledoc """
  The Recommendations context.
  """

  import Ecto.Query, warn: false
  alias Vcr.Repo

  alias Vcr.Recommendations.Recommendation

  @doc """
  Returns the list of recommendations.

  ## Examples

      iex> list_recommendations()
      [%Recommendation{}, ...]

  """
  def list_recommendations do
    Repo.all(Recommendation)
  end

  @doc """
  Gets a single recommendation.

  Raises `Ecto.NoResultsError` if the Recommendation does not exist.

  ## Examples

      iex> get_recommendation!(123)
      %Recommendation{}

      iex> get_recommendation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_recommendation!(id), do: Repo.get!(Recommendation, id)

  @doc """
  Creates a recommendation.

  ## Examples

      iex> create_recommendation(%{field: value})
      {:ok, %Recommendation{}}

      iex> create_recommendation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_recommendation(attrs \\ %{}) do
    %Recommendation{}
    |> Recommendation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a recommendation.

  ## Examples

      iex> update_recommendation(recommendation, %{field: new_value})
      {:ok, %Recommendation{}}

      iex> update_recommendation(recommendation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_recommendation(%Recommendation{} = recommendation, attrs) do
    recommendation
    |> Recommendation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Recommendation.

  ## Examples

      iex> delete_recommendation(recommendation)
      {:ok, %Recommendation{}}

      iex> delete_recommendation(recommendation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_recommendation(%Recommendation{} = recommendation) do
    Repo.delete(recommendation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking recommendation changes.

  ## Examples

      iex> change_recommendation(recommendation)
      %Ecto.Changeset{source: %Recommendation{}}

  """
  def change_recommendation(%Recommendation{} = recommendation) do
    Recommendation.changeset(recommendation, %{})
  end
end
