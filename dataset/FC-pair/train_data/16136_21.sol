contract c16136{
    // Refund ether to the investors (invoke from only token)
    function refund(address _to) public refundAllowed {
        require(msg.sender == tokenContractAddress);
        uint256 valueToReturn = balances[_to];
        // update states
        balances[_to] = 0;
        weiRaised = weiRaised.sub(valueToReturn);
        _to.transfer(valueToReturn);
    }
}