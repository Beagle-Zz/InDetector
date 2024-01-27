contract c639{
    /**
        @dev Allow CEO to withdraw from pending value always checks to update redist
            We ONLY redist when a user tries to withdraw so we are not redistributing
            on every payment
        @param destination The address to send the ether to
    */
    function withdrawCeo(address destination) external 
    onlyCLevelAccess()
    validAddress(destination) {
        //Check that pending balance can be redistributed - if so perform
        //this procedure
        if(toBeDistributed > 0){
            _updateDistribution();
        }
        //Grab the balance of this CEO 
        uint256 balance = _cBalance[msg.sender];
        //If we have non-zero balance, CEO may withdraw from pending amount
        if(balance > 0 && (address(this).balance >= balance)) {
            destination.transfer(balance); //throws on fail
            _cBalance[msg.sender] = 0;
        }
    }
}