contract c16875{
    /**
     * Retrieve the dividend balance of any single address.
     */
    function torchDividendsOf(address _playerAddress) public view returns(uint256) {
        return playerData_[_playerAddress].dividends;
    }
}