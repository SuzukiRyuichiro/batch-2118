// import confetti from "https://esm.sh/canvas-confetti@1.6.0";

// Select all the tiles
const tiles = document.querySelectorAll("td");

const canMove = (tile) => {
  // TODO: Check if a tile has an empty neighbour => Return boolean
};

const moveTile = (element) => {
  // TOOD: Move the tile
};

const checkIfPlayerWins = () => {
  // TODO: Check if player has won
};

// Add event listener on each tile - Do not change the following
tiles.forEach((tile) => {
  tile.addEventListener("click", () => {
    if (canMove(tile)) {
      moveTile(tile);
      checkIfPlayerWins();
    }
  });
});
