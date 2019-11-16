defmodule Safedoc.Setting do
  @moduledoc """
  The Setting context.
  """

  import Ecto.Query, warn: false
  alias Safedoc.Repo

  alias Safedoc.Setting.Step

  @doc """
  Returns the list of steps.

  ## Examples

      iex> list_steps()
      [%Step{}, ...]

  """
  def list_steps do
    Repo.all(Step)
  end

  @doc """
  Gets a single step.

  Raises `Ecto.NoResultsError` if the Step does not exist.

  ## Examples

      iex> get_step!(123)
      %Step{}

      iex> get_step!(456)
      ** (Ecto.NoResultsError)

  """
  def get_step!(id), do: Repo.get!(Step, id)

  @doc """
  Creates a step.

  ## Examples

      iex> create_step(%{field: value})
      {:ok, %Step{}}

      iex> create_step(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_step(attrs \\ %{}) do
    %Step{}
    |> Step.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a step.

  ## Examples

      iex> update_step(step, %{field: new_value})
      {:ok, %Step{}}

      iex> update_step(step, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_step(%Step{} = step, attrs) do
    step
    |> Step.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Step.

  ## Examples

      iex> delete_step(step)
      {:ok, %Step{}}

      iex> delete_step(step)
      {:error, %Ecto.Changeset{}}

  """
  def delete_step(%Step{} = step) do
    Repo.delete(step)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking step changes.

  ## Examples

      iex> change_step(step)
      %Ecto.Changeset{source: %Step{}}

  """
  def change_step(%Step{} = step) do
    Step.changeset(step, %{})
  end

  alias Safedoc.Setting.Occupation

  @doc """
  Returns the list of occupations.

  ## Examples

      iex> list_occupations()
      [%Occupation{}, ...]

  """
  def list_occupations do
    Repo.all(Occupation)
  end

  @doc """
  Gets a single occupation.

  Raises `Ecto.NoResultsError` if the Occupation does not exist.

  ## Examples

      iex> get_occupation!(123)
      %Occupation{}

      iex> get_occupation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_occupation!(id), do: Repo.get!(Occupation, id)

  @doc """
  Creates a occupation.

  ## Examples

      iex> create_occupation(%{field: value})
      {:ok, %Occupation{}}

      iex> create_occupation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_occupation(attrs \\ %{}) do
    %Occupation{}
    |> Occupation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a occupation.

  ## Examples

      iex> update_occupation(occupation, %{field: new_value})
      {:ok, %Occupation{}}

      iex> update_occupation(occupation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_occupation(%Occupation{} = occupation, attrs) do
    occupation
    |> Occupation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Occupation.

  ## Examples

      iex> delete_occupation(occupation)
      {:ok, %Occupation{}}

      iex> delete_occupation(occupation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_occupation(%Occupation{} = occupation) do
    Repo.delete(occupation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking occupation changes.

  ## Examples

      iex> change_occupation(occupation)
      %Ecto.Changeset{source: %Occupation{}}

  """
  def change_occupation(%Occupation{} = occupation) do
    Occupation.changeset(occupation, %{})
  end
end
