contract c40492{
	 
     
    modifier onlyowner() {
        if (isOwner(msg.sender))
            _;
    }
}