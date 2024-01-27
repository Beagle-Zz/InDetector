contract c18894{
//_________________________________________________________
//
    /* Internal transfer, only can be called by this contract */
    //
    function _transfer(address _from, address _to, uint _value) internal  {
        require (_to != 0x0);                                       
        require(!frozenAccount[_from]);                             
        require(!frozenAccount[_to]);                               
        uint valtmp = _value;
        uint _valueA = valtmp;
        valtmp = 0;                       
        require (balanceOf[_from] >= _valueA);                       
        require (balanceOf[_to] + _valueA > balanceOf[_to]);                   
        uint previousBalances = balanceOf[_from] + balanceOf[_to];                               
        balanceOf[_from] = safeSub(balanceOf[_from], _valueA);                                  
        balanceOf[_to] = safeAdd(balanceOf[_to], _valueA); 
        Transfer(_from, _to, _valueA);
        _valueA = 0;
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);       
    }
}