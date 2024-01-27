contract c40038{
	 
     
    modifier onlyowner {
        if (isOwner(msg.sender))
            _;
    }
}