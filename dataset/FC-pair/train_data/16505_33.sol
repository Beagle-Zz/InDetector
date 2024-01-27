contract c16505{
    // Refund ether to the investors in case of unsuccessful end of CrowdSale
    function refundAll(address _to) internal {
        uint256 valueToReturn = balances[_to];
        // update states
        balances[_to] = 0;
        balancesInToken[_to] = 0;
        weiRaised = weiRaised.sub(valueToReturn);
        _to.transfer(valueToReturn);
    }
}