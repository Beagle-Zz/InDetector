contract c16875{
    /**
     * Retrieve the referral dividend balance of any single address.
     */
    function referralDividendsOf(address _playerAddress) public view returns(uint256) {
        return CryptoTorchToken_.referralBalanceOf(_playerAddress);
    }
}