contract c16877{
    /**
     * Retrieve the token balance of any single address.
     */
    function balanceOf(address _playerAddress) public view returns(uint256) {
        return tokenBalanceLedger_[_playerAddress];
    }
}