contract c2013{
    /// @notice Starts the auction
    function startAuction() public onlyOwner{
        require(status == state.pending);
        status = state.active;
        emit Started(block.number);
    }
}