contract c8386{
    /* Internal transfer, can only be called by this contract */
    function _transfer(address _from, address _to, uint256 _value) internal {//
		if(_from != owner){
			require (!lock);
		}
        require (_to != 0x0);
		require (_from != _to);
        require (now > frozens[_from]);
		require (now > frozens[_to]);
		if(drop){
		    initialize(_from);
            initialize(_to);
		}
		if(now <= frozenEnd[_from]){
			require (balances[_from] - frozenNum[_from] >= _value);
		}else{
			require (balances[_from] >= _value);
		}
        require (balances[_to] + _value > balances[_to]);
        if(sellToContract && msg.sender.balance < minEtherForAccounts){
            sell((minEtherForAccounts - msg.sender.balance) / sellPrice);
        }
        balances[_from] -= _value;
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);
    }
}