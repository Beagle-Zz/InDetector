contract c8715{
	/**
    * Donate ETH tokens to contract (Owner)
    */
	function donation() 
    external payable 
    returns (bool success){
        emit Donated(msg.sender, msg.value);
        return(true);
    }
}