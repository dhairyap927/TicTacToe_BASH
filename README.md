# TicTacToe_BASH
A simple game implementation using Bash scripting. Players input is taken from an input file and then is read from the file to update the board, and the script determines the winner or declares a draw. Features error handling and uses exit codes for outcomes.

## Prerequisites

- Bash shell (usually available by default on Linux and macOS systems)

## How to Run

1. Clone the repository or download the script file `tic_tac_toe.sh` to your local machine.

2. Open a terminal or command prompt and navigate to the directory where the script is located.

3. Make the script executable by running the following command:

   ```shell
   chmod +x tic_tac_toe.sh
   ```

4. Run the script by providing the following command:

   ```shell
   ./tic_tac_toe.sh [X|O] [moves_file]
   ```

   - Replace `[X|O]` with either "X" or "O" to specify the starting player. The starting player will make the first move.
   - `[moves_file]` should be the path to a file containing the moves of both players, with each move on a separate line.

   For example:

   ```shell
   ./tic_tac_toe.sh X moves.txt
   ```

   The above command starts the game with player "X" and reads the moves from the `moves.txt` file.

## Gameplay

- The game board is displayed at the beginning with numbered positions for each cell.

   ```
   1 | 2 | 3 
   -----------
   4 | 5 | 6 
   -----------
   7 | 8 | 9 
   ```

- Players take turns making their moves by entering the position number they want to mark. Valid moves are numbers from 1 to 9.

- The moves are validated to ensure they are valid positions and that the players take turns correctly.

- After each move, the updated game board is displayed.

- The game continues until a player wins or the game ends in a draw.

- If a player wins, the script will declare the winner and display the final game board.

- If the game ends in a draw, the script will declare it and display the final game board.

## Example Moves File

The moves file should contain a sequence of moves made by both players, with each move on a separate line. Each move should correspond to a position on the game board (1 to 9). Here's an example moves file:

```
1
5
2
9
6
```

The above file represents the moves:

- Player X: Position 1
- Player O: Position 5
- Player X: Position 2
- Player O: Position 9
- Player X: Position 6

Save the moves file and provide its path as an argument when running the script.

## Winning Conditions

A player can win the game by achieving any of the following conditions:

- Getting three marks in a row (horizontal, vertical, or diagonal).

## Draw Condition

If all positions on the game board are filled and no player has achieved a winning condition, the game ends in a draw.

## Error Handling

The script includes error handling for the following scenarios:

- Invalid command-line arguments: If the arguments are not provided in the correct format, an error message is displayed.
- Invalid moves file: If the moves file does not exist or is not readable, an error message is displayed.
- Invalid moves: If the moves in the file are not valid positions or the players do not take turns correctly, an error message is displayed.

## Notes

- The script uses the `sed` command to update the game board file with the players' moves.
- The game board file is named `final_pattern` and is created in the same directory as the script. The file is overwritten for each new game.
- The script exits with a unique code for each outcome (win, draw, error) to indicate the result.



---

Please create a new file called `README.md` in your GitHub repository and paste the above content into it. Make sure to replace `[moves_file]` with the actual filename and update any other necessary details.

Remember to include the script file `tic_tac_toe.sh` and the `LICENSE` file along with the README file in your GitHub repository.

If you have any further questions, feel free to ask!
