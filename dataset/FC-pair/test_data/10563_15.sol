contract c10563{
	// Block / Unlock address handling tokens
    function OWN_freezeAddress(address target, bool freeze) onlyOwner public {
        frozenAccount[target] = freeze;
        emit FrozenFunds(target, freeze);
    }
}