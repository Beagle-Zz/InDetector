contract c10934{
	/// Function to destroy the smart contract
    function OWN_kill() onlyOwner public { 
		selfdestruct(owner); 
    }
}