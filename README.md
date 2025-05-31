# pastebin-bash

pastebin-bash is a Bash function that allows you to easily post text or files to pastebin.com using `curl`. 

## Features

With pastebin-bash, you can:

- **Post simple messages** to pastebin.com using the command `pastebin 'your message'`.
- **Post entire files** to pastebin.com using the command `cat your_file.txt | pastebin` or `pastebin -f your_file.txt`.
- **Customize your pastes** with options for:
  - Title/name (`-n`, `--name`)
  - Expiration time (`-e`, `--expire`)
  - Privacy level (`-p`, `--private`)
  - Syntax highlighting (`-l`, `--language`)
- **Get the URL** of your post in the standard output.
- **View help documentation** with `pastebin -h` or `pastebin --help`.

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

Once set up, you can use the `pastebin` function in your terminal:

### Basic Usage

- To post a message:
  ```bash
  pastebin 'your message'
  ```

- To post a file:
  ```bash
  cat your_file.txt | pastebin
  # OR
  pastebin -f your_file.txt
  ```

### Advanced Options

- To post a file with syntax highlighting:
  ```bash
  pastebin -f script.py -l python -n "My Python Script"
  ```

- To create a private paste that expires in one hour:
  ```bash
  pastebin -p 1 -e 1H "Secret message"
  ```

- To see all available options:
  ```bash
  pastebin --help
  ```

#### Available Options

| Option | Description | Values |
|--------|-------------|--------|
| `-f`, `--file` | Read from file instead of stdin or argument | File path |
| `-n`, `--name` | Set paste name/title | Text |
| `-e`, `--expire` | Set expiration time | N_MINUTES, 1H, 1D, 1W, 2W, 1M, 6M, 1Y |
| `-p`, `--private` | Set privacy level | 0=public, 1=unlisted, 2=private |
| `-l`, `--language` | Set syntax highlighting language | python, bash, c, etc. |
| `-h`, `--help` | Display help message | |

## Contributors

The original concept for this script was inspired by a [Stack Overflow post](https://stackoverflow.com/a/58440856/10637718). All credit goes to the original author.

## Project Status

pastebin-bash is maintained and actively developed. The latest update includes enhanced functionality, better error handling, and improved security with HTTPS support. Contributions and feature requests are welcome.
