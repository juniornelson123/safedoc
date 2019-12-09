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

  alias Safedoc.Setting.Activity

  @doc """
  Returns the list of activities.

  ## Examples

      iex> list_activities()
      [%Activity{}, ...]

  """
  def list_activities do
    Repo.all(Activity)
  end

  @doc """
  Gets a single activity.

  Raises `Ecto.NoResultsError` if the Activity does not exist.

  ## Examples

      iex> get_activity!(123)
      %Activity{}

      iex> get_activity!(456)
      ** (Ecto.NoResultsError)

  """
  def get_activity!(id), do: Repo.get!(Activity, id)

  @doc """
  Creates a activity.

  ## Examples

      iex> create_activity(%{field: value})
      {:ok, %Activity{}}

      iex> create_activity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_activity(attrs \\ %{}) do
    %Activity{}
    |> Activity.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a activity.

  ## Examples

      iex> update_activity(activity, %{field: new_value})
      {:ok, %Activity{}}

      iex> update_activity(activity, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_activity(%Activity{} = activity, attrs) do
    activity
    |> Activity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Activity.

  ## Examples

      iex> delete_activity(activity)
      {:ok, %Activity{}}

      iex> delete_activity(activity)
      {:error, %Ecto.Changeset{}}

  """
  def delete_activity(%Activity{} = activity) do
    Repo.delete(activity)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking activity changes.

  ## Examples

      iex> change_activity(activity)
      %Ecto.Changeset{source: %Activity{}}

  """
  def change_activity(%Activity{} = activity) do
    Activity.changeset(activity, %{})
  end

  alias Safedoc.Setting.Indexer

  @doc """
  Returns the list of indexers.

  ## Examples

      iex> list_indexers()
      [%Indexer{}, ...]

  """
  def list_indexers do
    Repo.all(Indexer)
  end

  @doc """
  Returns the list of indexers.

  ## Examples

      iex> list_indexers()
      [%Indexer{}, ...]

  """
  # def list_indexers(activity_id) do
  #   query = from t in Indexer,
  #           where: t.activity_id == ^activity_id
  #   Repo.all(query)
  # end

  @doc """
  Gets a single indexer.

  Raises `Ecto.NoResultsError` if the Indexer does not exist.

  ## Examples

      iex> get_indexer!(123)
      %Indexer{}

      iex> get_indexer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_indexer!(id), do: Repo.get!(Indexer, id)

  @doc """
  Creates a indexer.

  ## Examples

      iex> create_indexer(%{field: value})
      {:ok, %Indexer{}}

      iex> create_indexer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_indexer(attrs \\ %{}) do
    %Indexer{}
    |> Indexer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a indexer.

  ## Examples

      iex> update_indexer(indexer, %{field: new_value})
      {:ok, %Indexer{}}

      iex> update_indexer(indexer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_indexer(%Indexer{} = indexer, attrs) do
    indexer
    |> Indexer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Indexer.

  ## Examples

      iex> delete_indexer(indexer)
      {:ok, %Indexer{}}

      iex> delete_indexer(indexer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_indexer(%Indexer{} = indexer) do
    Repo.delete(indexer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking indexer changes.

  ## Examples

      iex> change_indexer(indexer)
      %Ecto.Changeset{source: %Indexer{}}

  """
  def change_indexer(%Indexer{} = indexer) do
    Indexer.changeset(indexer, %{})
  end

  alias Safedoc.Setting.IndexerData

  @doc """
  Returns the list of indexer_datas.

  ## Examples

      iex> list_indexer_datas()
      [%IndexerData{}, ...]

  """
  def list_indexer_datas(document_id) do
    query = from i in IndexerData, where: i.document_id == ^document_id, order_by: [desc: i.inserted_at]
    Repo.all(query)
  end

  @doc """
  Returns the list of indexer_datas.

  ## Examples

      iex> list_indexer_datas()
      [%IndexerData{}, ...]

  """
  def list_indexer_datas do
    Repo.all(IndexerData)
  end

  @doc """
  Gets a single indexer_data.

  Raises `Ecto.NoResultsError` if the Indexer data does not exist.

  ## Examples

      iex> get_indexer_data!(123)
      %IndexerData{}

      iex> get_indexer_data!(456)
      ** (Ecto.NoResultsError)

  """
  def get_indexer_data!(id), do: Repo.get!(IndexerData, id)

  @doc """
  Creates a indexer_data.

  ## Examples

      iex> create_indexer_data(%{field: value})
      {:ok, %IndexerData{}}

      iex> create_indexer_data(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_indexer_data(attrs \\ %{}) do
    %IndexerData{}
    |> IndexerData.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a indexer_data.

  ## Examples

      iex> update_indexer_data(indexer_data, %{field: new_value})
      {:ok, %IndexerData{}}

      iex> update_indexer_data(indexer_data, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_indexer_data(%IndexerData{} = indexer_data, attrs) do
    indexer_data
    |> IndexerData.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a IndexerData.

  ## Examples

      iex> delete_indexer_data(indexer_data)
      {:ok, %IndexerData{}}

      iex> delete_indexer_data(indexer_data)
      {:error, %Ecto.Changeset{}}

  """
  def delete_indexer_data(%IndexerData{} = indexer_data) do
    Repo.delete(indexer_data)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking indexer_data changes.

  ## Examples

      iex> change_indexer_data(indexer_data)
      %Ecto.Changeset{source: %IndexerData{}}

  """
  def change_indexer_data(%IndexerData{} = indexer_data) do
    IndexerData.changeset(indexer_data, %{})
  end

  alias Safedoc.Setting.ContainersService

  @doc """
  Returns the list of containers_services.

  ## Examples

      iex> list_containers_services()
      [%ContainersService{}, ...]

  """
  def list_containers_services do
    Repo.all(ContainersService)
  end

  @doc """
  Gets a single containers_service.

  Raises `Ecto.NoResultsError` if the Containers service does not exist.

  ## Examples

      iex> get_containers_service!(123)
      %ContainersService{}

      iex> get_containers_service!(456)
      ** (Ecto.NoResultsError)

  """
  def get_containers_service!(id), do: Repo.get!(ContainersService, id)

  @doc """
  Creates a containers_service.

  ## Examples

      iex> create_containers_service(%{field: value})
      {:ok, %ContainersService{}}

      iex> create_containers_service(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_containers_service(attrs \\ %{}) do
    %ContainersService{}
    |> ContainersService.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a containers_service.

  ## Examples

      iex> update_containers_service(containers_service, %{field: new_value})
      {:ok, %ContainersService{}}

      iex> update_containers_service(containers_service, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_containers_service(%ContainersService{} = containers_service, attrs) do
    containers_service
    |> ContainersService.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ContainersService.

  ## Examples

      iex> delete_containers_service(containers_service)
      {:ok, %ContainersService{}}

      iex> delete_containers_service(containers_service)
      {:error, %Ecto.Changeset{}}

  """
  def delete_containers_service(%ContainersService{} = containers_service) do
    Repo.delete(containers_service)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking containers_service changes.

  ## Examples

      iex> change_containers_service(containers_service)
      %Ecto.Changeset{source: %ContainersService{}}

  """
  def change_containers_service(%ContainersService{} = containers_service) do
    ContainersService.changeset(containers_service, %{})
  end
end
