contract c16675{
    //================= Crowdsale Only =================
    function mint(address _to, uint _amount) public
    onlyCrowdsaleMinter
    isNotStartedOnly
    returns(bool)
    {
        totalSupply = totalSupply.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        return true;
    }
}