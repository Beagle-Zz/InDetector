contract c16818{
    /**
     * Retrieve the token dividend balance of any single address.
     */
    function tokenDividendsOf(address _playerAddress) public view returns(uint256) {
        return CryptoTorchToken_.dividendsOf(_playerAddress);
    }
}