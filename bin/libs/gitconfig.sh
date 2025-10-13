function get_gitlab_email {
  local GITLAB_URI="$1"

  local request=`curl "https://gitlab.com/${GITLAB_URI}" 2> /dev/null`

  local name=`echo "${request}" | grep -E 'property="og:url"' | grep -Po 'gitlab\.com\/\K[^"]+'`
  local user_id=`echo "${request}" | grep root-url | grep -Po 'user-id="\K[^"]+'`

  echo "${user_id}-${name}@users.noreply.gitlab.com"
}


function get_github_name {
  local REQUEST="$1"

  local name=`echo "${REQUEST}" | grep 'octolytics-dimension-user_id' | grep -oP 'content="\K[^"]+' | sed -n "2p"`

  echo "${name}"
}

function get_github_user_id {
  local REQUEST="$1"

  local user_id=`echo "${REQUEST}" | grep 'octolytics-dimension-user_id' | grep -oP 'content="\K[^"]+' | head -n 1`

  echo "${user_id}"
}

function get_github_email {
  local REQUEST="$1"

  local name=`get_github_name "${REQUEST}"`
  local user_id=`get_github_user_id "${REQUEST}"`

  echo "${user_id}+${name}@users.noreply.github.com"
}

function get_github_by_url {
  local GITHUB_URI="$1"

  local REQUEST=`curl "https://github.com/${GITHUB_URI}" 2> /dev/null`

  local user_id=`get_github_user_id "${REQUEST}"`
  local name=`get_github_name "${REQUEST}"`
  local email=`get_github_email "${REQUEST}"`

  echo "${user_id} ${name} ${email}"
}

###---------------------

function get_gitlab_name {
  local REQUEST="$1"

  local name=`echo "${REQUEST}" | grep -E 'property="og:url"' | grep -Po 'gitlab\.com\/\K[^"]+'`

  echo "${name}"
}

function get_gitlab_user_id {
  local REQUEST="$1"

  local user_id=`echo "${REQUEST}" | grep root-url | grep -Po 'user-id="\K[^"]+'`

  echo "${user_id}"
}

function get_gitlab_email {
  local REQUEST="$1"

  local name=`get_gitlab_name "${REQUEST}"`
  local user_id=`get_gitlab_user_id "${REQUEST}"`

  echo "${user_id}-${name}@users.noreply.gitlab.com"
}

function get_gitlab_by_url {
  local GITLAB_URI="$1"

  local REQUEST=`curl "https://gitlab.com/${GITLAB_URI}" 2> /dev/null`

  local user_id=`get_gitlab_user_id "${REQUEST}"`
  local name=`get_gitlab_name "${REQUEST}"`
  local email=`get_gitlab_email "${REQUEST}"`

  echo "${user_id} ${name} ${email}"
}
