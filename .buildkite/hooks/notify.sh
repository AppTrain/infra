set -euo pipefail

postMessage="https://slack.com/api/chat.postMessage"

get_slack_token(){
    OUTPUT=$(aws secretsmanager get-secret-value --secret-id "build-ops/slack-token")
    TOKEN=$(echo $OUTPUT | jq -r '.SecretString | fromjson | .["build-ops-slack-token"]')
    echo $TOKEN
    return 0
}

get_repo_msg(){
    msg="*repo*: \`$BUILDKITE_PIPELINE_SLUG\` *branch*: \`$BUILDKITE_BRANCH\` *by*: \`$BUILDKITE_BUILD_CREATOR\`"
    json=$(jq -n --arg msg "$msg" '{type: "section", text: {type: "mrkdwn", text: $msg}}')
    echo $json
}

get_build_msg(){
    msg="[$BUILDKITE_PIPELINE_SLUG/$BUILDKITE_BUILD_NUMBER]($BUILDKITE_BUILD_URL)"
    json=$(jq -n --arg msg "$msg" '{type: "section", text: {type: "mrkdwn", text: $msg}}')
    echo $json
}

get_divider(){
    divider=$(jq -n '{type: "divider"}')
    echo $divider
}

TOKEN=$(get_slack_token)
CHANNEL="#builds"

jq -n \
    --arg channel "$CHANNEL" \
    --argjson divider "$(get_divider)" \
    --argjson repo "$(get_repo_msg)" \
    --argjson build "$(get_build_msg)" \
    '{"channel": $channel, "blocks": [$divider, $repo, $build, $divider]}' | \
    curl -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${TOKEN}" \
    -d @- \
    $postMessage