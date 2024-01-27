contract c10934{
	// Creator/Owner can Locked/Unlock smart contract
    function OWN_ChangeState_locked(bool _locked) onlyOwner public {
        SC_locked = _locked;
    }
}