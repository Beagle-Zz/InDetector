contract c7071{
    /*
     * PUBLIC FUNCTIONS
     */
    /// Drains ARP.
    function drain() public {
        require(msg.sender == owner);
        // solium-disable-next-line security/no-block-members
        require(now >= depositStartTime.add(DRAIN_DELAY));
        uint256 balance = arpToken.balanceOf(address(this));
        require(balance > 0);
        arpToken.safeTransfer(owner, balance);
        emit Drained(balance);
    }
}