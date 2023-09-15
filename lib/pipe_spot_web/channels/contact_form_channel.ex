defmodule PipeSpotWeb.ContactFormChannel do
  @moduledoc false

  use LiveState.Channel, web_module: PipeSpotWeb

  alias PipeSpot.Contacts

  @impl true
  def init(_channel, _params, _socket) do
    {:ok, %{complete: false}}
  end

  @impl true
  def handle_event("create-contact", contact_attrs, state) do
    case Contacts.create_contact(contact_attrs) do
      {:ok, _contact} -> {:noreply, Map.put(state, :complete, true)}
      {:error, _} -> {:noreply, state}
    end
  end

end
