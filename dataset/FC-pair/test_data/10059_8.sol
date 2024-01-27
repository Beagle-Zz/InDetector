contract c10059{
    /**
     * function to pause the crowdsale 
     * can only be called from owner wallet
     **/
    function pauseCrowdsale() public onlyOwner {
        isCrowdsalePaused = true;
    }
}