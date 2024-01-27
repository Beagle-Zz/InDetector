contract c12528{
    /**
    * @notice Function to claim any token stuck on contract
    */
    function externalTokensRecovery(token _address) onlyAdmin public {
        uint256 remainder = _address.balanceOf(this); //Check remainder tokens
        _address.transfer(msg.sender,remainder); //Transfer tokens to admin
    }
}