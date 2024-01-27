contract c16433{
    // Send weis to the wallet
    function forwardFunds(uint256 _value) internal {
        wallet.transfer(_value);
    }
}