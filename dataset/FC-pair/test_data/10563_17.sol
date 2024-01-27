contract c10563{
	// Function Change Owner
	function OWN_transferOwnership(address newOwner) onlyOwner public {
        // function allowed only if the address is not smart contract
        if (!isContract(newOwner)) {	
			owner = newOwner;
		}
    }
}