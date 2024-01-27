contract c10565{
    /**
     * @dev Air drop single amount
     * @param _recipient - Address of the recipient
     * @param _amount - Amount to drain
     */
    function airdropSingleAmount(address _recipient, uint256 _amount) external
      onlyAdmin
    {
        assert(_amount <= token.balanceOf(this));
        assert(token.transfer(_recipient, _amount));
    }
}