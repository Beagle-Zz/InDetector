contract c8911{
    /// @dev Triggers unsold tokens to be issued to `target` address.
    function close() public onlyOwner afterEnd {
        if (totalEthReceived < GOAL) {
            SaleFailed();
        } else {
            issueUnsoldToken();
            SaleSucceeded();
        }
    }
}