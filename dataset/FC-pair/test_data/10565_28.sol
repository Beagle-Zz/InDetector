contract c10565{
    /**
    * @dev Token Contract Emergency Drain
    * @param _token - Token to drain
    * @param _amount - Amount to drain
    */
    function emergencyERC20Drain(ERC20 _token, uint256 _amount) public
        onlyOwner
    {
        _token.transfer(owner, _amount);
    }
}