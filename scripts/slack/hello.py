import os
import slack

tk = os.environ["SLACK_API_TOKEN"]
client = slack.WebClient(token=tk)

response = client.chat_postMessage(
    channel="#builds",
    # user='jeremiah',
    text="hello world, basic test",
)

assert response["ok"]
