contract c12703{
    //================= Crowdsale Only =================
    function mint(address _to, uint _amount) public
    only(owner)
    isNotStartedOnly
    returns(bool)
    {
        totalSupply = totalSupply.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        Transfer(msg.sender, _to, _amount);
        return true;
    }
}