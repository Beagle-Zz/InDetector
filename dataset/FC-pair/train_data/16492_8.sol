contract c16492{
    /**
    * @dev Set game state paused for updates, pauses the entire creation
    * @param _setPaused Boolean sets the game paused or not
    */
    function setGameState(bool _setPaused) public contract_onlyOwner returns(bool _paused) {
        paused = _setPaused;
        fcfPaused = _setPaused;
        fusionPaused = _setPaused;
        return paused;
    }
}