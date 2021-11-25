# GitHub Repositories

The **GitHub Repositories extension** lets you quickly browse, search, edit, and commit to any remote GitHub repository directly from within Visual Studio Code. Support for Azure Repos (part of Azure DevOps) is in preview, with only readonly operations currently supported.

## Why do you need GitHub Repositories?

As developers, we often clone Git repos locally just to browse them or make small edits. We may want to look at the source code of a library we use, experiment with new tools, or just feel the desire to learn something new.

However, cloning repos takes time and maintenance, as your local copy can quickly become out of date if you don't pull changes regularly. Plus, if you don't know the codebase you're cloning, there may be security risks involved too!

The GitHub Repositories extension in VS Code gives you a fast, convenient, and safe way to open, browse, and edit repos quickly.

Here are some **great situations** in which you may choose to use GitHub Repositories to work on a codebase:

- To **browse**, **learn**, or **search** a codebase or parts of one, either as it exists today or at any point in history, directly in VS Code.
- To **create, edit, and review** documentation, blog posts, notes, etc., using VS Code's powerful **Markdown** editor.
- To make **changes** that don't require building or running tests, although validations can still run in GitHub Actions triggered on commit.
- To quickly review **pull requests** (PRs), without having to check-out or in any way affect your local setup.
- And many more!

While GitHub Repositories is a great solution for many scenarios today, it does have certain limitations as you'll see below, so it's not (_yet?_) a cure-all. As such, there are still many situations where you may still want to clone a repository and get the full power of VS Code and all its extensions.

## Getting started

You can quickly and easily open a GitHub repository either by searching for _GitHub Repositories: Open Repository..._ from the Command Palette (press `F1`), or by choosing _Open GitHub Repository..._ from the remote indicator (the green button in the lower left corner of the status bar).

If you haven’t logged into GitHub from VS Code before, you’ll be prompted to authenticate with your GitHub account.

You can then search for a repo or pull request. In the gif below, we search for and select the VS Code repo on GitHub, VS Code reloads, and the repo’s contents loads similarly as if we cloned it locally:

![Opening the VS Code repo remotely](https://raw.githubusercontent.com/microsoft/vscode-remote-repositories-github/main/docs/remote-repositories.gif)

## Features

### GitHub repositories

This extension provides the following support for GitHub repositories:

- **Open any GitHub repository** directly from GitHub &mdash; no cloning or local repository required.
- **Quickly search** for a repository or pull request to open &mdash; can also copy/paste links directly from GitHub.
- Repositories always **open to the latest version** on GitHub, unless you have uncommitted changes
- Similar to editing directly on GitHub, **changes will go directly to GitHub on commit** &mdash; no pushing or publishing branches required.
- Working changes are independent to the branch &mdash; **work on multiple branches simultaneously**!
  - When you pause work on one branch and switch to another one, you don’t need to stash your changes &mdash; they’ll stay on the previous branch, and when you go back, your changes will be there to pick up right where you left off.
- Automatically detects if there are new changes on GitHub &mdash; always **stay up to date**.
  - Indicates the number of unpulled commits on the status bar.
  - **Flags potential merge conflicts** if you've modified the same file as someone else.
- Open GitHub Repositories in the **Remote Explorer** to see all the GitHub repositories you've accessed.
  - You can quickly open a GitHub repository to continue working, or view and compare any uncommitted changes you may have. Additionally, you can **apply uncommitted changes across branches** from the same repository.
- Search files in the repository.

### Azure repositories

This extension provides the following _readonly_ support for Azure repositories:

- **Open any Azure repository** directly from Azure Repos; no cloning or local repository required.
- Copy/paste links directly from Azure Repos to open the repository directly in VS Code.
- Repositories always **open to the latest version**.
- Switch between branches and tags in the repository using the branch picker in the status bar.
- Search files in the repository.

Support for editing files and creating commits, branches, and pull requests in Azure Repos is coming soon.

### Continue Working On...

When working with either GitHub or Azure repositories, you have several options to continue working in a more powerful environment.

- When you choose _Continue Working On..._ from the Command Palette or from the remote indicator, you're presented the option to continue your work locally, in a container volume (if you have the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension), or in GitHub Codespaces.

  ![Continue On command options](https://raw.githubusercontent.com/microsoft/vscode-remote-repositories-github/main/docs/continue-on.png)

## Limitations

When you work in a traditional git workflow (i.e. `git clone`), files are saved to your computer’s local file system. But when working with GitHub Repositories, the code doesn’t live on your local computer: it’s still just on GitHub. You work with the code through a virtual file system, which is an abstraction that simulates having local files while getting the content from somewhere else; GitHub in this case. When you open a workspace on a virtual file system, it’s known as a virtual workspace.

There are certain limitations while working with virtual workspaces:

- While your code doesn't live on your computer, your edits do. If you want to access your changes in GitHub or on another machine, make sure you commit.
- Debugging, terminals, and tasks are not currently supported. Terminals open on your local file system and don’t have access to the virtual file system of the remote repository.
- Limited language intelligence - Features like IntelliSense and go-to-definition may be impacted as many languages don't yet understand the virtualized environment of GitHub Repositories.
- Search - Full-text search requires a pre-built index for exact text matching, otherwise it will fallback to GitHub's fuzzy default-branch only native search.
- Extensions - Not all extensions can support running in a virtual workspace, but over time more extensions will support it. For example, extensions that depend on direct access to local files won't be able to support this.

You can learn more about virtual file systems, workspaces, and how to implement them for extensions in the [virtual workspaces guide](https://github.com/microsoft/vscode/wiki/Virtual-Workspaces).

As we continue development of GitHub Repositories, expect the feature set to grow and the limitations to shrink!

## Updates and release notes

While an optional install, this extension releases along with VS Code. The [VS Code release notes](https://code.visualstudio.com/updates/) will include a summary of changes.

You can also install the [_GitHub Repositories (Insiders)_ extension](https://marketplace.visualstudio.com/items?itemName=GitHub.remotehub-insiders) in VS Code Insiders for early feedback and testing. Note, the Stable and Insiders version of this extension can NOT be installed at the same time — use the Extensions Viewlet to choose which version of the extension you want to use. No data is shared between the Stable and Insiders versions of the extension.

## Questions, feedback, contributing

Have a question or feedback?

You can [file an issue or feature request](https://github.com/microsoft/vscode-remote-repositories-github).

Or connect with the community...

[![Twitter](https://raw.githubusercontent.com/microsoft/vscode-remote-repositories-github/main/docs/Twitter_Social_Icon_24x24.png)](https://twitter.com/code) [![Stack Overflow](https://raw.githubusercontent.com/microsoft/vscode-remote-repositories-github/main/docs/so-image-24x24.png)](https://stackoverflow.com/questions/tagged/vscode) [![VS Code Dev Community Slack](https://raw.githubusercontent.com/microsoft/vscode-remote-repositories-github/main/docs/Slack_Mark-24x24.png)](https://aka.ms/vscode-dev-community) [![VS CodeGitter](https://raw.githubusercontent.com/microsoft/vscode-remote-repositories-github/main/docs/gitter-icon-24x24.png)](https://gitter.im/Microsoft/vscode)

## Telemetry

The GitHub Repositories extension collects telemetry data to help us build a better experience working remotely from VS Code. The extension respects the `telemetry.enableTelemetry` setting which you can learn more about in the [Visual Studio Code FAQ](https://aka.ms/vscode-remote/telemetry).

## License

By downloading and using the GitHub Repositories extension and its related components, you agree to the product [license terms](https://marketplace.visualstudio.com/items/GitHub.remotehub/license) and [privacy statement](https://www.microsoft.com/en-us/privacystatement/EnterpriseDev/default.aspx).
