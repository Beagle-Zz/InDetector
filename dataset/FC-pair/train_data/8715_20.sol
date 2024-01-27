contract c8715{
    /**
    * Check ETH balance of contract
    */
	function balance()
	external view
	returns (uint amount){
		return (address(this).balance);
	}
}