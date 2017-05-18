defmodule Czynopimy.Participant do
  use Czynopimy.Web, :model

  schema "participants" do
    field :google_id, :integer
    field :name, :string
    field :avatar_url, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:google_id, :name, :avatar_url])
    |> validate_required([:google_id, :name, :avatar_url])
  end
end
