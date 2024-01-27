contract c7461{
    /**
    * Transfer tokens/eth to the escapeHatchDestination.
    * Used as a safety mechanism to prevent the bridge from holding too much value
    *
    * before being thoroughly battle-tested.
    * @param _token the token to transfer. 0x0 for ETH
    * @param _amount the amount to transfer
    */
    function escapeFunds(address _token, uint _amount) external onlyEscapeHatchCallerOrOwner {
        // @dev Logic for ether
        if (_token == 0) {
            escapeHatchDestination.transfer(_amount);
        // @dev Logic for tokens
        } else {
            ERC20 token = ERC20(_token);
            require(token.transfer(escapeHatchDestination, _amount));
        }
        emit EscapeFundsCalled(_token, _amount);
    }
}