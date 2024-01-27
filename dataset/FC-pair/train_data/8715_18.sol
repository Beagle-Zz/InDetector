contract c8715{
	/**
    * Tranfer all ETH from contract to Owner addres.
    */
    function withdraw()
    onlyOwner external
    returns (bool success){
        require(address(this).balance > 0, "Nothing to withdraw");
        owner.transfer(address(this).balance);
        return true;
    }
}