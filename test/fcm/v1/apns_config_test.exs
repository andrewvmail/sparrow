defmodule Sparrow.FCM.V1.APNSTest do
  use ExUnit.Case

  alias Sparrow.APNS.Notification
  alias Sparrow.FCM.V1.APNS

  test "apns config is built correcly" do
    token_getter = fn -> {"Authorization", "Bearer dummy token"} end

    apns_notification =
      Notification.new("dummy device token")
      |> Notification.add_title("apns title")
      |> Notification.add_body("apns body")

    apns = APNS.new(apns_notification, token_getter)

    assert token_getter == apns.token_getter
    assert apns_notification == apns.notification
  end
end
