contract c16576{
    /*
     * checks game is currently active
    */
    modifier gameIsActive {
        if (gamePaused == true) throw;
        _;
    }
}