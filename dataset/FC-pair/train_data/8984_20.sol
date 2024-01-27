contract c8984{
    //start Authority and control
    modifier onlyOwner(){
		require(msg.sender == owner);
        _;
	}
}