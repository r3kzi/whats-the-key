# whats-the-key

[![lua-ci](https://github.com/r3kzi/whats-the-key/actions/workflows/lua-ci.yml/badge.svg)](https://github.com/r3kzi/whats-the-key/actions/workflows/lua-ci.yml)

A lightweight World of Warcraft addon that automatically prints your Mythic+ key level and the associated dungeon name 
immediately after joining a group via the Looking For Group (LFG) system.

---

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

---

## Features

- **Automatic Detection:** Detects when you join a group via LFG.
- **Key Level & Dungeon Info:** Prints the Mythic+ key level and dungeon name to your chat window.
- **Lightweight & Efficient:** Designed to have minimal impact on game performance.
- **Easy to Customize:** Modify the output format or behavior by editing the Lua source.

---

## Installation

1. **Download the Addon:**
    - Obtain the latest release from the project's [Releases page](#) (or clone the repository if you're contributing).

2. **Extract & Install:**
    - Unzip the downloaded file.
    - Copy the resulting folder into your World of Warcraft `Interface/AddOns` directory.
        - **Windows:** `C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns`
        - **Mac:** `/Applications/World of Warcraft/_retail_/Interface/AddOns`
    - Make sure the addon folder is not nested (i.e., it should be `Interface/AddOns/YourAddonName`, not `Interface/AddOns/YourAddonName/YourAddonName`).

3. **Enable the Addon:**
    - Launch World of Warcraft.
    - At the character select screen, click on the "AddOns" button and ensure the addon is enabled.
    - Log in and type `/reload` if needed to refresh the interface.

---

## Usage

- **Automatic Output:**  
  Once you join a group via LFG, the addon automatically prints a message to your chat window with your key level and the corresponding dungeon name.

---

## Contributing

Contributions to the addon are highly appreciated! To ensure a smooth collaboration process, please follow these guidelines:

1. **Fork & Clone:**
    - Fork the repository to your GitHub account.
    - Clone your fork locally:
      ```bash
      git clone https://github.com/yourusername/whats-the-key.git
      ```

2. **Branching:**
    - Create a new branch for your feature or bug fix:
      ```bash
      git checkout -b feature/your-feature-name
      ```

3. **Coding Standards:**
    - Follow the established Lua coding style (e.g., consistent indentation, descriptive variable names, and clear comments).
    - Test your changes in-game to ensure they work as expected.
    - Keep changes focused and document your code for readability.
    - See and run the [Makefile](Makefile) file if unsure

4. **Commit Messages:**
    - Write clear, concise commit messages. We do enforce [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
    - Reference related issues (if any) by number.

5. **Pull Requests:**
    - Once your changes are complete, push your branch to your fork:
      ```bash
      git push origin feature/your-feature-name
      ```
    - Open a pull request (PR) against the `main` branch of the original repository.
    - In your PR description, include:
        - A summary of your changes.
        - Any additional context or testing notes.
        - Screenshots or logs (if applicable) that demonstrate your changes.

6. **Issues & Feedback:**
    - Use GitHub Issues to report bugs, suggest new features, or request enhancements.
    - Provide detailed descriptions to help maintainers understand and reproduce the issue.

Your contributions help improve the addon for the entire community. Thank you for taking the time to contribute!

---

## License

This project is licensed under the Apache License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgements

- **World of Warcraft API Community:** For the excellent documentation and community support.
- **Inspiration:** Other similar addons, such as [What The Keystone](https://www.curseforge.com/wow/addons/what-the-keystone), have been a major inspiration for this project.

---

*For more information, questions, or to contribute, please visit our GitHub repository.*
