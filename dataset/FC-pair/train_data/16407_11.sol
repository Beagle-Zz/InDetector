contract c16407{
    /**
    * @dev Query game state. Paused (True) or not?
    */
    function getGameState() public constant returns(bool _paused) {
        return paused;
    }
}