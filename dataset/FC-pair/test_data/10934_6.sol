contract c10934{
	// Get Smart Contract of the address approved
    function SmartContract_Allowed(address _target) constant public returns (bool _sc_address_allowed) {
        return SmartContract_Allowed[_target];
    }
}