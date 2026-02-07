#### Version Control

- Tracks changes to code over time
- Uses a key-value store (SHA-1 hash)

#### Git Terminology

Repo - a Git project (tracked folder with a .git directory)
Commit - a snapshot of your files and metadata
Branch - a movable pointer to a specific commit
Remote - a reference to an external Git host i.e GitHub, GitLab
Staging Area - also called the index; a buffer between your working directory and the repo what you plan to commit

Blobs - "binary large object" stores the actual content of the files
Trees - stores filenames, file paths, and pointers to blobs (files) and other trees (directories)

Refs - pointer to a commit
HEAD - pointer to the current branch or commit you are working on
Index - the actual file .git/index, a binary file that holds the staging area info
Object Store - .git/objects/ - where Git stores all blobs, trees, and commits by SHA hash
Tag - a ref to a specific commit, often used for marking releases

#### Git Common Commands

`git init` - initialises a new Git repo with .git directory
`git add` - stage changes
`git commit` - snapshot changes
`git status` - show stage/unstage work
`git log` - show commit history
`git diff` - show what changed
`git config` - set user/email
`git help <command>` - built-in docs
`git clone` - copy a remote repo
`git rm` - remove files
`git mv` - rename files
`git restore` - undo file changes

#### Viewing History

`git log` - see commit history
`git log --online --graph` - visual summary
`git show <commit>` - view a specific commit
`git diff` - compare unstaged vs last commit
`git diff --staged` - compare staged vs last commit
`git blame <file>` - show who last changed each line
`git reflog` - view local HEAD history (even deleted branches) 

#### Git vs Github

Git (CLI)
GitHub (Platform)

Git
- version control tool
- locally on your computer
- tracks and manage code history on the CLI
- allows offline use
- open source

Github
- Git repo hosting and collaboration
- on the web (cloud)
- Share code, manage code, open PRs, collaborate on the GUI.
- only works online
- Owned by Microsoft

#### Branching 101

git branch - list/create branches
git checkout -b <branch> - create & switch
git switch -c <branch> - modern version
git switch <branch> - switch branches safely
git branch -d <branch> - delete branch

#### Merging

Combine changes from one branch into another
git merge <branch> - merge target into current branch
Fast-forward vs recursive (true merge)
May cause conflicts - manual resolution required

#### Visualise Branches & Logs

git log --oneline > gives compact commit view
git log --graph > visual tree structure
git log --oneline --graph --all > compact, visual, full view

Great for debugging merges and tracking branches

Helps to see what is really happening under the hood.

#### Rebase Vs Merge

Merge:
- Preserves history
- Creates a new commit
- Good for team workflows

Rebase:
- Rewrites history (linear)
- No merge commits
- Ideal for cleanup before PR

Use Merge when - working collaboratively
Use Rebase when - cleaning up your local history

#### Git Stash & Pop

git stash - temporarily save uncommited changes
git stash list - view all stashes
git stash apply - reapply latest stash
git stash pop - reapply and delete the stash

Use when switching branches mid-task
Great for "I'm not ready to commit, but I need to move."

#### Reset, Revert and Cherry-Pick

git revert
- creates a new commit that undoes another
- safe for shared history
- used in production

git reset
- move branch pointer backward
- soft = keep changes
- mixed = unstage
- hard = nuke everything

git cherry-pick
- apply a single commit from another branch
- useful for hotfixes or targeted changes

#### Forks & Pull Requests

Fork = your own copy of someone else's repo (on Github)
Clone the forked repo to your local machine
Make changes ---> push to your fork
Open a Pull Request (PR) to propose your changes
Used in open source and cross-team workflows
Original repo owner can review, comment, and merge

#### Collaborating Practices

Use branches to isolate work
Push to remote and open pull requests
Assign reviewers, use Github's UI for comments
Resolve conflicts before merge
Use issues, projects, discussions to track work
Keep commits focused and clean

#### Git Workflow

Dev pulls latest main or clones repo

Create feature branch

Work locally --> commit --> push branch

Open PR --> review & merge

Team syncs regularly via git pull --rebase or merge

#### Trunk-Based Development

- All devs commit to main or short-lived branches
- Heavy CI/testing gates
- Used in fast-moving orgs i.e Google or Meta

#### Git Best Practices

Commit Hygiene:

- write good commit messages
    - use squashing before merging PRs
        - one logical change per commit
            - avoid noisy merges or fixfixfinalfinal2

Pre-Commit & Automation

- run linters/tests before committing (pre-commit, Husky, tflint)
- prevent broken code from entering the repo
- hook into CI pipelines for formatting, testing and scanning

Common Mistakes

- forgetting to pull before pushing
- force pushing to shared branches 
- committing secrets
- merging without review
- not usng .gitignore properly

Security & Secrets Hygiene

- Do not commit secrets
- Audit git logs
