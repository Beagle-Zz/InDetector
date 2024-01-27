contract c12756{
    /// @dev change exchange for this token. (extends EIP-823)
    function changeExchange(address _exchange) public onlyOwner {
        require(_exchange != address(0));
        exchange = BaseTokenExchangeInterface(_exchange);
        emit ExchangeChanged(_exchange);
    }
}