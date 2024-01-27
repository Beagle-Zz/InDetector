contract c12524{
    /**
    * @notice Function to claim any token stuck on contract
    */
    function externalTokensRecovery(ERC20Basic _address) onlyAdmin(2) public{
        require(_address != tokenReward); //Only any other token
        uint256 remainder = _address.balanceOf(this); //Check remainder tokens
        _address.transfer(msg.sender,remainder); //Transfer tokens to admin
    }
}