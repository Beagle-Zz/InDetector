contract c16492{
    /**
    * @dev unpause Fusions so Founder can Fuse
    * @param _setPaused Boolean sets the game paused or not
    */
    function setGameStateFusion(bool _setPaused) public contract_onlyOwner returns(bool _pausedFusions) {
        fusionPaused = _setPaused;
        return fusionPaused;
    }
}