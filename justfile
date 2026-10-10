# Just a config file for Just task runner
# Usage instructions at https://just.systems/man/en/

# Variables
project := "companies"
GIT_HASH := `git rev-parse --short HEAD`

# Task aliases
alias c := commit
alias s := status
alias l := log

# Default task lists available Just tasks
default:
  @just --list

# Git status
[group('Git')]
status:
  @echo "Git commit hash: {{GIT_HASH}} \n"
  git status -sb

# Git log summary
[group('Git')]
log:
  @echo "Git commit hash: {{GIT_HASH}} \n"
  git log --oneline --graph --decorate -20

# Latest Git commit
[group('Git')]
last:
  @echo "Git commit hash: {{GIT_HASH}} \n"
  git log -1 HEAD --stat

# Commit code changes to Git repository
[group('Git')]
commit:
  git commit

# Publish code changes to GitHub repository
[group('Git')]
publish: check-clean
  git push

# Check repository for uncommitted code changes
[group('Git')]
check-clean:
    @git diff --exit-code || (printf "\e[1;97;43m[Warning]\e[0m Uncommitted changes in {{project}}! \n" && exit 1)
    @git diff --cached --exit-code || (printf "\e[1;97;43m[Warning]\e[0m Staged changes in {{project}}! \n" && exit 1)

# Calculate size of files in the project directory
[group('Helpers')]
filesize:
  du -sh

# Calculate lines of code in different filetypes
[group('Helpers')]
sloc:
  @echo "Lines of text in Markdown files:"
  @echo ""
  @echo "`wc -l *.md`"

# What are the most changed files during the past year?
[group('Audit')]
audit-git-most-changes:
  git log --format=format: --name-only --since="1 year ago" | sort | uniq -c | sort -nr | head -20

# What are the most changed files during the whole project?
[group('Audit')]
audit-git-most-changes-since-beginning:
  git log --format=format: --name-only | sort | uniq -c | sort -nr | head -20

# What are the most changed CSS files during the whole project?
[group('Audit')]
audit-git-most-changes-since-beginning-css:
  git log --format=format: --name-only -- src/assets/styles/ | sort | uniq -c | sort -nr | head -20

# Who made most of the Git commits?
[group('Audit')]
audit-git-contributors:
  git shortlog -sn --no-merges

# Potential problem areas
[group('Audit')]
audit-git-bug-clusters:
  git log -i -E --grep="fix|bug|broken" --name-only --format='' | sort | uniq -c | sort -nr | head -20

# Commit count by month, for the entire history of the repo.
[group('Audit')]
audit-git-commit-count-by-month:
  git log --format='%ad' --date=format:'%Y-%m' | sort | uniq -c

# Revert and hotfix frequency in all commits
[group('Audit')]
audit-git-revert-hotfix-frequency-all:
  git log --oneline | grep -iE 'revert|hotfix|emergency|rollback'

# Revert and hotfix frequency in a year
[group('Audit')]
audit-git-revert-hotfix-frequency-year:
  git log --oneline --since="1 year ago" | grep -iE 'revert|hotfix|emergency|rollback'
