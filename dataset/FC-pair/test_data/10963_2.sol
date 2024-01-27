contract c10963{
    /**
     * transfer value token to "_to"
     */
    function _transfer(address _from, address _to, uint256 _value) internal {
       require(_value > 0x0);
       require(balances[_from] >= _value);
       require(balances[_to] + _value > balances[_to]);
       uint previousBalances = SafeMath.add(balances[_from], balances[_to]);
       balances[_from] = SafeMath.sub(balances[_from], _value);                   
       balances[_to] = SafeMath.add(balances[_to], _value); 
       assert(SafeMath.add(balances[_from], balances[_to]) == previousBalances);
    }
}