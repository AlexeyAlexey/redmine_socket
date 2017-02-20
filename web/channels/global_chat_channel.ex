defmodule RedmineSocket.GlobalChatChannel do
  use RedmineSocket.Web, :channel
  alias RedmineSocket.AnnotationView

  @max_age 2 * 7 * 24 * 60 * 60
  def join("global_chat:" <> users_ids, params, socket) do
    resp = %{}
    #params {usersToken: this.usersToken}
    case Phoenix.Token.verify(socket, "salt", params["usersToken"], max_age: @max_age, key_digest: :sha) do
      {:ok, %{users_ids: users_ids}} ->
        {:ok, resp, assign(socket, :users_ids, users_ids)}
      {:error, _reason} ->
        #:error     
        {:error, %{reason: "unauthorized"}}   
    end
  end

  def handle_in("send_message", params, socket) do
    IO.puts "send_message"
  	IO.inspect params
  	broadcast! socket, "send_message", %{
      who_sent: socket.assigns.user_id,
  	  massage:  params["message"]
  	}

    {:reply, :ok, socket}
  end
end