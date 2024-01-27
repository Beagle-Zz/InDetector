contract c40499{
	 
     
    modifier onlyowner() {
        if (isOwner(msg.sender))
            _;
    }
}