contract c8710{
    /**
     @dev Public function to be call by owner when ICO status is Paused, it changes ICO status to the right status
          based on ICO dates.
     */
    function unpause() public onlyOwner onlyInState(StatusList.Paused) {
        updateStatus();
        updateStatusViaTokens();
    }
}