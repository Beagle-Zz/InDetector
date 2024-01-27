contract c18047{
    // burn tokens if soft cap is not reached
    function burnInvestorTokens(
        address _address,
        uint256 _amount
    ) public onlyCrowdSale returns (uint256) {
        require(block.timestamp > crowdSaleEndTime);
        require(_amount <= balances[_address]);
        balances[_address] = balances[_address].sub(_amount);
        totalSupply_ = totalSupply_.sub(_amount);
        Transfer(_address, address(0), _amount);
        return _amount;
    }
}