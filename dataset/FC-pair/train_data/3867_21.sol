contract c3867{
    /**
    * @dev called by the owner to unpause, returns to normal state
    */
    function unpause() onlyOwner whenPaused public {
        paused = false;
        tokenReward.startICO();
        emit Unpause();
    }
}