defmodule Czynopimy.Repo.Migrations.CreateParticipant do
  use Ecto.Migration

  def change do
    create table(:participants) do
      add :google_id, :integer
      add :name, :string
      add :avatar_url, :string

      timestamps()
    end

  end
end
