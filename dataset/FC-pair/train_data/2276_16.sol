contract c2276{
    /**
     * @dev Allow operators to remove a contract from the whitelist
     * @param _addr Contract address to be removed
     */
    function removeFromWhitelist(address _addr) public onlyOperator {
        require(
            _addr != address(0),
            "Invalid address."
        );
        // Make sure the address is in whitelist
        require(
            isWhitelisted[_addr],
            "Address not in whitelist."
        );
        isWhitelisted[_addr] = false;
        if (total > 0) {
            total--;
        }
        emit AddressRemovedFromWhitelist(_addr, msg.sender);
    }
}