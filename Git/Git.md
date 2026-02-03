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