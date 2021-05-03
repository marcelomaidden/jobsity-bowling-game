<h1 align="center">Bowling app</h1>

## About bowling app
Bowling app is a game that reads a file with the player's pinfalls and calculates the total score for it. When the player hits a strike it sums the next two points to the total. When the player hits a spare it sums the next point to the total. The player is allowed to play 10 frames with 2 chances per frame.
Built with Ruby and tested with RSpec. The output was formatted using terminal-table and rainbow gem packages.
<hr>

![screenshot](./screenshot.png)

## About the project
The game has a basic interface that runs in the terminal.

The goals of this project are:

- Practice with OOP (Object Oriented Programming) using Ruby.
- Learn how to create and structure a Ruby project.
- Learn to manage the files with correct usage to make code maintainable.
- Practice Git Flow and Github Flow creating branches for different features and for version control.

## Setup

To get a local copy up and running follow these simple example steps.

## Prerequisites
Computer running Mac OS, Windows, or Linux Ubuntu.

Have Ruby installed. You can see this link for more detailed instructions [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/).


You should have Git installed. [Install Git](https://git-scm.com/downloads)

### Installation

After installing Ruby and Git, you can download the repo or clone it (paste on the terminal) 
`git clone git@github.com:marcelomaidden/jobsity-bowling-game.git`
then change to the project directory 
`cd jobsity-bowling-game`

Finally install the necessary packages by typing the command below:

  `bundle install`

## Running bowling game
You will need to execute the main file located inside the root folder inside the project. 
You must pass as a parameter a file with the `txt` extension.

An example of file is available inside the assets folder with a basic two player game.

A valid game file must have one throw per line with the player's name and the pins knocked down `tab separated`


`ruby main.rb assets/game.txt`

## How to test

In order to test our project type the command below:

  rspec --format documentation

## 👥 Author

👤**Marcelo Araújo**

- GitHub: [@marcelomaidden](https://github.com/marcelomaidden)
- Twitter: [@marcelomaidden](https://twitter.com/marcelomaidden)
- LinkedIn: [Marcelo Fernandes de Araújo](https://www.linkedin.com/in/marcelo-fernandes-de-ara%C3%BAjo-56700a171/)

## Acknowledgments
- Jobsity
- Ruby
- RSpec
- Terminal-table
- Rainbow


## 🤝 contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/marcelomaidden/jobsity-bowling-game/issues).

## show-your-support

Give a ⭐️ if you like this project!
