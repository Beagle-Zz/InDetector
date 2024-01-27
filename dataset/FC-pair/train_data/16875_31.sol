contract c16875{
    /**
     * Retrieve the token balance of any single address.
     */
    function balanceOf(address _playerAddress) public view returns(uint256) {
        return CryptoTorchToken_.balanceOf(_playerAddress);
    }
}