#!/usr/bin/env bash
# pastebin.sh - A utility for posting text to pastebin.com
# Version: 2.0.0
# Author: Samuel Caldas

# Function: print_usage
# Description: Displays usage information
print_usage() {
  cat << EOL
Usage: pastebin [OPTIONS] [TEXT]
Post text to pastebin.com and get the URL of the paste.

Options:
  -f, --file FILE       Read from FILE instead of stdin or argument
  -n, --name NAME       Set paste name/title
  -e, --expire TIME     Set expiration time (N_MINUTES, 1H, 1D, 1W, 2W, 1M, 6M, 1Y)
  -p, --private LEVEL   Set privacy level (0=public, 1=unlisted, 2=private)
  -l, --language LANG   Set syntax highlighting language
  -h, --help            Display this help message
  
Environment variables:
  PASTEBIN_API_KEY      Required API key from pastebin.com
  
Examples:
  echo "Hello World" | pastebin
  pastebin "Hello World"
  pastebin -f script.py -n "My Python Script" -l python
EOL
}

# Function: handle_error
# Description: Processes error messages
# Arguments:
#   $1 - Error message
#   $2 - Exit code (optional, defaults to 1)
handle_error() {
  local message="$1"
  local exit_code="${2:-1}"
  
  echo "Error: $message" >&2
  return "$exit_code"
}

# Function: validate_api_key
# Description: Checks if the API key is set
validate_api_key() {
  if [ -z "$PASTEBIN_API_KEY" ]; then
    handle_error "PASTEBIN_API_KEY environment variable is not set."
    return 1
  fi
  return 0
}

# Function: send_to_pastebin
# Description: Sends data to pastebin.com API
# Arguments:
#   $1 - Content to paste
#   $2 - Paste name/title (optional)
#   $3 - Expiration time (optional)
#   $4 - Privacy level (optional)
#   $5 - Syntax highlighting format (optional)
send_to_pastebin() {
  local content="$1"
  local paste_name="${2:-}"
  local paste_expire="${3:-N}"
  local paste_private="${4:-0}"
  local paste_format="${5:-text}"
  local api_response
  
  # Prepare API parameters
  local api_params=(
    "api_dev_key=$PASTEBIN_API_KEY"
    "api_option=paste"
    "api_paste_code=$content"
  )
  
  # Add optional parameters if provided
  [ -n "$paste_name" ] && api_params+=("api_paste_name=$paste_name")
  [ -n "$paste_expire" ] && api_params+=("api_paste_expire_date=$paste_expire")
  [ -n "$paste_private" ] && api_params+=("api_paste_private=$paste_private")
  [ -n "$paste_format" ] && api_params+=("api_paste_format=$paste_format")
  
  # Convert parameters array to string
  local api_params_str=$(IFS=\& ; echo "${api_params[*]}")
  
  # Send request to pastebin.com
  api_response=$(curl -s -X POST "https://pastebin.com/api/api_post.php" \
                     --data-raw "$api_params_str" 2>&1)
  
  local curl_exit_code=$?
  
  # Check for curl errors
  if [ $curl_exit_code -ne 0 ]; then
    handle_error "Failed to connect to pastebin.com: $api_response"
    return $curl_exit_code
  fi
  
  # Check for API errors (API errors start with "Bad API request")
  if [[ "$api_response" == Bad\ API\ request* ]]; then
    handle_error "API error: $api_response"
    return 1
  fi
  
  # Success - print the URL
  echo "$api_response"
  return 0
}

# Function: main
# Description: Main function that processes arguments and calls appropriate functions
pastebin() {
  local content=""
  local file=""
  local paste_name=""
  local paste_expire="N"
  local paste_private="0"
  local paste_format="text"
  
  # Validate API key first
  validate_api_key || return $?
  
  # Parse command line arguments
  while [ $# -gt 0 ]; do
    case "$1" in
      -h|--help)
        print_usage
        return 0
        ;;
      -f|--file)
        if [ -z "$2" ]; then
          handle_error "File option requires a filename"
          return 1
        fi
        file="$2"
        shift
        ;;
      -n|--name)
        if [ -z "$2" ]; then
          handle_error "Name option requires a value"
          return 1
        fi
        paste_name="$2"
        shift
        ;;
      -e|--expire)
        if [ -z "$2" ]; then
          handle_error "Expire option requires a value"
          return 1
        fi
        paste_expire="$2"
        shift
        ;;
      -p|--private)
        if [ -z "$2" ]; then
          handle_error "Private option requires a value"
          return 1
        fi
        paste_private="$2"
        shift
        ;;
      -l|--language)
        if [ -z "$2" ]; then
          handle_error "Language option requires a value"
          return 1
        fi
        paste_format="$2"
        shift
        ;;
      -*)
        handle_error "Unknown option: $1"
        return 1
        ;;
      *)
        content="$1"
        ;;
    esac
    shift
  done
  
  # Determine input source and get content
  if [ -n "$file" ]; then
    # Read from file
    if [ ! -f "$file" ]; then
      handle_error "File not found: $file"
      return 1
    fi
    content=$(cat "$file")
  elif [ -z "$content" ]; then
    # Read from stdin if no argument or file provided
    content=$(cat)
  fi
  
  # Send to pastebin
  send_to_pastebin "$content" "$paste_name" "$paste_expire" "$paste_private" "$paste_format"
  return $?
}

# Allow sourcing without executing
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  pastebin "$@"
  exit $?
fi
