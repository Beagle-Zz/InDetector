contract c169{
    /// @dev Trading limited
    function transfer(address _to, uint256 _value) public returns (bool) {
        if(tradingOpen || msg.sender == saleTokensAddress || msg.sender == bountyTokensAddress
                        || msg.sender == advisorsTokensAddress) {
            return super.transfer(_to, _value);
        }
        return false;
    }
}