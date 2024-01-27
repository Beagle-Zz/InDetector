contract c16877{
    /**
     * Retrieve the paid-profits balance of any single address.
     */
    function profitsOf(address _playerAddress) public view returns(uint256) {
        return profitsReceived_[_playerAddress];
    }
}