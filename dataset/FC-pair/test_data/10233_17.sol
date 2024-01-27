contract c10233{
    /**
    * @dev Reset team token states
    *
    */
    function endGameInternal() private {
        gameOpponent = address(0);
        gameTime = 0;
        status = 0;
    }
}