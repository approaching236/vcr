defmodule Vcr.Recommendations.Recommendation do
  use Ecto.Schema
  import Ecto.Changeset


  schema "recommendations" do
    field :availability, :string
    field :description, :string
    field :energy, :string
    field :name, :string
    field :noise, :string
    field :price, :string

    timestamps()
  end

  @doc false
  def changeset(recommendation, attrs) do
    recommendation
    |> cast(attrs, [:name, :description, :energy, :noise, :availability, :price])
    |> validate_required([:name, :description, :energy, :noise, :availability, :price])
  end
end
