contract c4753{
    /// @dev Used to set exchange address
    /// @param _exchange the address of the exchange
    function setExchange(address _exchange) internal {
        require(exchangeAddress == address(0));
        exchangeAddress = _exchange;
    }
}