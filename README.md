# Personal Scripts Collection

This is a collection of utility scripts for development workflow automation, Git
operations, tmux session management, and system maintenance.

## Requirements

- Bash 4.0+
- Git
- Common Unix utilities (grep, sed, awk, etc.)

### Optional Dependencies

Some scripts require additional tools. For example:
- `fzf` - for interactive selection in `cheatsheet` and `ftldr`
- `tldr` - for `ftldr` script
- `tmux` - for tmux-related scripts
- `curl` - for `cheatsheet` script
- Python 3.13+ with `uv` for Python scripts

## Scripts

### Development Tools

**`cheatsheet`**  
Access cheatsheet (cht.sh) with curl. Topic selection is done with fzf.

**`ftldr`**  
Use tldr command with fzf for interactive topic selection.

**`pre-commit-fixme`**  
Git pre-commit hook that prevents commits containing FIXME comments.

**`run-code-commands`** *(Python)*  
Automatically run appropriate code formatting and linting commands based on file
types in the current directory.

### Git Operations

**`git-dirty-all`** *(Python)*  
Find all Git repositories with uncommitted changes in a directory tree.

**`git-lines-commited`**  
Show number of lines added/removed by the current user in recent commits.

**`git-scour`**  
Search for and display Git repositories in a directory tree.

**`git-unwip`**  
Fetch a remote WIP branch, reset the top WIP commit into the current branch, and
clean up WIP branches.

**`git-wip`**  
Take current unstaged work and create a WIP branch on remote for temporary
storage.

### Remote Repository Management

**`pull-all-remote-git`**  
Execute "git pull origin" for the primary branch in all remote Git repositories.

**`push-all-remote-git`**  
Execute "git push origin" in all remote Git repositories.

### Tmux Session Management

**`tmux-kill-session`**  
Kill current tmux session and switch to 'general' session if available.

**`tmux-new-project`**  
Create a new tmux session in a specified directory.

**`tmux-new-session`**  
Create a new tmux session with a specified name.

**`tmux-new-session-pwd`**  
Create a new tmux session based on the current working directory name.

### System Utilities

**`pretty-path`**  
Display PATH environment variable in a readable format with optional filtering.

**`reduce-count`**  
Count and display file statistics by extension in the current directory.

**`setup`**  
System setup and configuration script.

**`setup-remote-shell`**  
Configure remote shell environment.

**`setup-ssh-agent`**  
Initialize SSH agent and add SSH keys automatically.

### Update Management

**`update-all`**  
Comprehensive system update script that runs all other update scripts.

**`update-languages`**  
Update programming language environments (pyenv, nodenv, goenv, pip, npm).

**`update-packages`**  
Update OS packages for Ubuntu, Fedora, Rocky Linux, and RHEL.

**`update-tools`**  
Update development tools and utilities.

### Template

**`template.bash`**  
Template script with standard structure, option parsing, and common functions
for creating new Bash scripts.

## Code Quality

All Bash scripts pass `shellcheck -o all` with appropriate suppressions for
acceptable patterns. The codebase also tries to follow consistent conventions:
- Error handling with `set -Eeuo pipefail`
- Standardized option parsing with `getopts`
- Use of the `-h` option for user help
