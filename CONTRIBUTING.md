# Contribution guidelines

If you notice a notable company in GitHub with something interesting in their public repositories, please make a pull request adding it.


## Requirements for a successful addition

* Structure of the items:

  ```md
  [Name](URL) | Languages
  ```

* Include a company name and a link to the GitHub organization using the Markdown format.
  * For example:

    ```md
    [GitHub, Inc.](https://github.com/github) | Language1, Language2, Language3
    ```

* Include a list of programming languages used on the Git repositories of the company.
  * Separate the company name/link and list of languages with a vertical pipe character (`|`) to keep the table formatted in correct way.
* For example:

  ```md
  [GitHub, Inc.](https://github.com/github) | Ruby, Markdown, HTML, CSS, Go, Shell, CoffeeScript, C#, C, C++, Objective-C, Java, PowerShell, Puppet, Go, Clojure, Swift
  ```

* Try to keep the list in alphabetical order.
  * [Visual Studio Code](https://code.visualstudio.com/) has `Sort Lines Ascending` feature
    * Select lines you want to sort
    * Open `Command Palette`
    * Write `sort` to the `Command Palette` to search for the command
    * Select `Sort Lines Ascending` from the list of commands
    * Save the sorted file to make sure you are committing the right file contents
  * [Atom](https://atom.io/) package [sort-lines](https://atom.io/packages/sort-lines) helps for keeping content sorted


## Example Git commit message

```txt
docs: add more organizations

- Add more companies to the list of GitHub organizations
```
