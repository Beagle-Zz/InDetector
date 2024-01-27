contract c2276{
    /**
     * @dev Allow operators to add whitelisted contracts
     * @param _newAddr New whitelisted contract address
     */
    function addToWhitelist(address _newAddr) public onlyOperator {
        require(
            _newAddr != address(0),
            "Invalid new address."
        );
        // Make sure no dups
        require(
            !isWhitelisted[_newAddr],
            "Address is already whitelisted."
        );
        isWhitelisted[_newAddr] = true;
        total++;
        emit AddressWhitelisted(_newAddr, msg.sender);
    }
}