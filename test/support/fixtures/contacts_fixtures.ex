defmodule PipeSpot.ContactsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PipeSpot.Contacts` context.
  """

  @doc """
  Generate a contact.
  """
  def contact_fixture(attrs \\ %{}) do
    {:ok, contact} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        phone_number: "some phone_number"
      })
      |> PipeSpot.Contacts.create_contact()

    contact
  end
end
