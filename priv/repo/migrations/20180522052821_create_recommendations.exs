defmodule Vcr.Repo.Migrations.CreateRecommendations do
  use Ecto.Migration

  def change do
    create table(:recommendations) do
      add :name, :string
      add :description, :text
      add :energy, :string
      add :noise, :string
      add :availability, :string
      add :price, :string

      timestamps()
    end

  end
end
