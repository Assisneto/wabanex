defmodule Wabanex.Training do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.{Exercises, User}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:start_date, :end_date, :user_id]

  schema "trainings" do
    field :start_date, :date
    field :end_date, :date

    belongs_to :user, User
    has_many :exercises, Exercises

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> cast_assoc(:exercises)
  end
end
