contract c10572{
	// Creator/Owner can Locked/Unlock smart contract
    function OWN_contractlocked(bool _locked) onlyOwner public {
        SC_locked = _locked;
    }
}