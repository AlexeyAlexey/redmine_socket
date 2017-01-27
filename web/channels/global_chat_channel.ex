defmodule RedmineSocket.GlobalChatChannel do
  use RedmineSocket.Web, :channel
  alias RedmineSocket.AnnotationView

  def join("global_chat:" <> users_ids, params, socket) do
  	
    resp = %{}
    {:ok, resp, assign(socket, :users_ids, users_ids)}
  end

  def handle_in("send_message", params, socket) do
  	
  	broadcast! socket, "send_message", %{
      who_sent: socket.assigns.user_id,
  	  massage:  params["message"]
  	}
  end
end