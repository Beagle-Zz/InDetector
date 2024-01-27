contract c7806{
     /**
     * function to pause the crowdsale 
     * can only be called from owner wallet
     **/
    function pauseCrowdsale() public onlyOwner {
        isCrowdsalePaused = true;
    }
}