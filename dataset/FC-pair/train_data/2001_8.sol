contract c2001{
    /**
        @dev Lock the contribution/shares methods
     */
    function lockShares() public onlyOwner() {
        require(!locked, "Shares already locked");
        locked = true;
    }
}