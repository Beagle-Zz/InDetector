contract c16388{
    /// @dev Change token symbol
    /// @param _symbol string
    function setSymbol(string _symbol) public ifAuthorized(msg.sender, APHRODITE) {
        symbol = _symbol;
    }
}