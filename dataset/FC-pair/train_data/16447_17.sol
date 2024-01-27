contract c16447{
    //When transfer tokens decrease dividendPayments for sender and increase for receiver
    function transfer(address _to, uint256 _value) public returns (bool) {
        // balance before transfer
        uint256 oldBalanceFrom = balances[msg.sender];
        // invoke super function with requires
        bool isTransferred = super.transfer(_to, _value);
        uint256 transferredClaims = dividendPayments[msg.sender].mul(_value).div(oldBalanceFrom);
        dividendPayments[msg.sender] = dividendPayments[msg.sender].sub(transferredClaims);
        dividendPayments[_to] = dividendPayments[_to].add(transferredClaims);
        return isTransferred;
    }
}