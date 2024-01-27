contract c655{
    /// @dev requires that the user isnt feeding a horsey already
    modifier feedingInProgress() {
        //if the key does not exit, then the default struct data is used where blockNumber is 0
        require(pendingFeedings[msg.sender].blockNumber != 0,"No pending feeding");
        _;
    }
}