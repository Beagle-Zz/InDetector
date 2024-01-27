contract c10563{
	// Function to destroy the smart contract
    function OWN_kill() onlyOwner public { 
		selfdestruct(owner); 
    }
}