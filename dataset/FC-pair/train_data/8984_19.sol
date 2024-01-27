contract c8984{
	//start Query data interface
    function balanceOf(address add)constant  public returns (uint256) {
	    return logic.balanceOf(add);
	}
}