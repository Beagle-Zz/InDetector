contract c16407{
    /**
    * @dev Set game state for fcf tokens only, so Founder can get Chibis pre launch
    * @param _setPaused Boolean sets the game paused or not
    */
    function setGameStateFCF(bool _setPaused) public contract_onlyOwner returns(bool _pausedFCF) {
        fcfPaused = _setPaused;
        return fcfPaused;
    }
}