contract c16818{
    /**
     * Retrieve the dividend balance of any single address.
     */
    function profitsOf(address _playerAddress) public view returns(uint256) {
        return playerData_[_playerAddress].profits.add(CryptoTorchToken_.profitsOf(_playerAddress));
    }
}