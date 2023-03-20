# pastebin-bash

pastebin-bash is a project that allows you to post text or files to pastebin.com using a bash function and curl.

## Features

With pastebin-bash you can:

- Post simple messages to pastebin.com using the command `pastebin 'your message'`.
- Post entire files to pastebin.com using the command `cat your_file.txt | pastebin`.
- Get the URL of your post in the standard output.

## Technologies used

pastebin-bash uses the following technologies:

- Bash: a scripting language used to interact with Unix-based operating systems.
- Curl: a command line tool used to transfer data via HTTP(S) protocols.

## Initialization

To use pastebin-bash you need:

- Have bash and curl installed on your operating system. You can check if they are installed using the commands `bash --version` and `curl --version`.
- Have an account on pastebin.com and obtain an API key on the page https://pastebin.com/api#1
- Copy and paste the bash function defined in the file pastebin.sh into your terminal and replace <your_api_key> with your API key obtained in the previous step.

## Future implementations

Some ideas for improving or expanding pastebin-bash are:

- Add options to configure privacy, expiration, and format of posts.
- Add options to list, edit or delete existing posts.
- Create an executable script that can be installed globally.

## Contributors

The original code was found at https://stackoverflow.com/a/58440856/10637718 and all credit goes to the original author.

## Project status

pastebin-bash is complete. There are no plans for new updates or maintenance.
