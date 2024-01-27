contract c2003{
    // Requires game to be currently active
    modifier gameIsActive {
        require(gameActive == true);
        _;
    }
}