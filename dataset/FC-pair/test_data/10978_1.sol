contract c10978{
    /**
     * Increase Owner token
     */
    function increaseSupply(uint _value) onlyOwner returns (bool)  {
        //totalSupply = safeAdd(totalSupply, value);
        balanceOf[owner] += _value;
        return true;
    }
}