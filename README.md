# pastebin-bash

pastebin-bash is a Bash function that allows you to easily post text or files to pastebin.com using `curl`. 

## Features

With pastebin-bash, you can:

- **Post simple messages** to pastebin.com using the command `pastebin 'your message'`.
- **Post entire files** to pastebin.com using the command `cat your_file.txt | pastebin`.
- **Get the URL** of your post in the standard output.

## Setup

To start using pastebin-bash, follow these steps:

1. **Ensure Dependencies**: Make sure `bash` and `curl` are installed on your system. You can verify this with:
   ```bash
   bash --version
   curl --version
   ```
2. **Obtain a Pastebin API Key**: 
   - Sign up for an account at [pastebin.com](https://pastebin.com).
   - Obtain your API key from the [Pastebin API documentation](https://pastebin.com/doc_api).
   
3. **Set Up the Function**:
   - Copy and paste the bash function from `pastebin.sh` into your terminal or add it to your `.bashrc` or `.bash_profile`.
   - Set the API key as an environment variable:
     ```bash
     export PASTEBIN_API_KEY='your_api_key'
     ```
   - Replace `'your_api_key'` with the API key obtained in step 2.

## Usage

Once set up, you can use the `pastebin` function directly in your terminal:

- To post a message:
  ```bash
  pastebin 'your message'
  ```

- To post a file:
  ```bash
  cat your_file.txt | pastebin
  ```

- The function returns the URL of your post, which you can access directly.

## Contributors

The original concept for this script was inspired by a [Stack Overflow post](https://stackoverflow.com/a/58440856/10637718). All credit goes to the original author.

## Project Status

pastebin-bash is functional and complete. Currently, there are no plans for further updates or maintenance, but contributions are welcome.
