contract c10604{
    /*
        @notice Pauses the balancer, if the Balancer is paused all ETH/tokens
            will be realyed to the coldwallet.
        @dev Any worker can pause the contract
    */
    function pause() public workerOrOwner returns (bool) {
        paused = true;
        return true;
    }
}