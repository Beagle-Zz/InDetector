contract c639{
    /// @dev requires that the user isnt feeding a horsey already
    modifier noFeedingInProgress() {
        //if the key does not exit, then the default struct data is used where blockNumber is 0
        require(pendingFeedings[msg.sender].blockNumber == 0,"Already feeding");
        _;
    }
}