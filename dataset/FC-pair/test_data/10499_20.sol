contract c10499{
	// Distribution Token from Admin
	function OWN_DistributeTokenAdmin_Multi(address[] addresses, uint256 _value, bool freeze) onlyOwner public {
		for (uint i = 0; i < addresses.length; i++) {
			//Block / Unlock address handling tokens
			frozenAccount[addresses[i]] = freeze;
			emit FrozenFunds(addresses[i], freeze);
			if (isContract(addresses[i])) {
				transferToContract(addresses[i], _value);
			} 
			else {
				transferToAddress(addresses[i], _value);
			}
		}
	}
}