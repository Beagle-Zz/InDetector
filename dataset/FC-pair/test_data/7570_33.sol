contract c7570{
    /**
    * @dev Allows owner to stop/pause crowdsale.
    */
    function stopCrowdsale() external onlyOwner {
        require(crowdsaleActive);
        crowdsaleActive = false;
        emit StopCrowdsale();
    }
}