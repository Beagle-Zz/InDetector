contract c10404{
    //start Authority and control
    modifier onlyOwner(){
		require(msg.sender == owner);
        _;
	}
}