contract c16643{
//puppet count
	function getPuppetCount() public constant returns(uint256 puppetCount){
    	return puppets.length;
  	}
}