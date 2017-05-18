defmodule Czynopimy.ParticipantTest do
  use Czynopimy.ModelCase

  alias Czynopimy.Participant

  @valid_attrs %{avatar_url: "some content", google_id: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Participant.changeset(%Participant{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Participant.changeset(%Participant{}, @invalid_attrs)
    refute changeset.valid?
  end
end
