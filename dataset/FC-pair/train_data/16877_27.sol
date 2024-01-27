contract c16877{
    /**
     * Retrieve the dividend balance of any single address.
     */
    function dividendsOf(address _playerAddress) public view returns(uint256) {
        return (uint256) ((int256)(profitPerShare_ * tokenBalanceLedger_[_playerAddress]) - payoutsTo_[_playerAddress]) / magnitude;
    }
}