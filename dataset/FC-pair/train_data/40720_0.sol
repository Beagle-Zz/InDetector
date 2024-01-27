contract c40720{
	 
     
    modifier onlyowner() {
        if (isOwner(msg.sender))
            _;
    }
}