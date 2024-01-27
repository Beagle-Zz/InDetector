contract c11390{
    //When transfer tokens decrease dividendPayments for token owner and increase for receiver
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        // balance before transfer
        uint256 oldBalanceFrom = balances[_from];
        // invoke super function with requires
        bool isTransferred = super.transferFrom(_from, _to, _value);
        uint256 transferredClaims = dividendPayments[_from].mul(_value).div(oldBalanceFrom);
        dividendPayments[_from] = dividendPayments[_from].sub(transferredClaims);
        dividendPayments[_to] = dividendPayments[_to].add(transferredClaims);
        return isTransferred;
    }
}