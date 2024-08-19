pastebin () {
  if [ -z "$PASTEBIN_API_KEY" ]; then
    echo "Error: PASTEBIN_API_KEY environment variable is not set."
    return 1
  fi

  if [ -z "$1" ]; then
    cat - | sed '1s/^/api_paste_code=/g' | sed 's/$/\%0A/g' | curl -d @- -d "api_dev_key=$PASTEBIN_API_KEY" -d 'api_option=paste' 'http://pastebin.com/api/api_post.php'
  else
    echo "$1" | sed '1s/^/api_paste_code=/g' | sed 's/$/\%0A/g' | curl -d @- -d "api_dev_key=$PASTEBIN_API_KEY" -d 'api_option=paste' 'http://pastebin.com/api/api_post.php'
  fi
  printf '\n'
}
