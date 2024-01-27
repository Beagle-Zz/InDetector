contract c18774{
    // check if address is withdrawed
    function checkIfEligable(address _address) public view returns (bool) {
    	return (isEligable[_address] && !hasWithdrawed[_address]) ;
    }
}