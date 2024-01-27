contract c8917{
    /** 
      * internal functions
    **/
    //burn function
    function _burn(address _who, uint256 _value) internal returns (bool success) {
        balances[_who] = balances[_who].sub(_value);
        totalSupply = totalSupply.sub(_value);
        emit Burn(_who, _value);
        emit Transfer(_who, address(0), _value);
        return true;
    }
}