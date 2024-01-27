contract c11890{
// function made for airdrop
	function airdrop(address[] _to, uint256[] _value) onlyOwner notStopped public {
	    for(uint256 i = 0; i < _to.length; i++){
	        if(balances[_to[i]] > 0){
	            continue;
	        }
	        transfer(_to[i], _value[i]);
	    }
	}
}