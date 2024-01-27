contract c1894{
    //// Update contract overview infomations when new token mined.
    function update(uint _value) public onlyMiner returns(bool) {
        totalSupply = totalSupply.add(_value);
        inVaults = inVaults.add(_value);
        return true;
    }
}