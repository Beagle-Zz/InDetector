contract c10036{
     /**
     * function to withdraw MarketingAndCommunityOutreach funds to the owner wallet
     * can only be called from owner wallet
     **/
    function withdrawMarketingAndCommunityOutreach() public onlyOwner {
        require (MarketingAndCommunityOutreachAccumulated > 0);
        owner.transfer(MarketingAndCommunityOutreachAccumulated);
        MarketingAndCommunityOutreachAccumulated = 0;
    }
}