contract c12810{
         //In case the ownership needs to be transferred
	function transferOwnership(address newOwner) external onlyOwner
	{
	    require( newOwner != 0x0);
	    balances[newOwner] = (balances[newOwner]).add(balances[owner]);
	    balances[owner] = 0;
	    owner = newOwner;
	   emit Transfer(msg.sender, newOwner, balances[newOwner]);
	}
}