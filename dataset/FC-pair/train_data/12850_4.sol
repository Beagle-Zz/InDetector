contract c12850{
    /**
     * Charge the advertiser with whatever clicks have been served by the ad engine.
     * 
     * @param advertiser    The address of the advertiser from whom we should debit ether
     * @param clicks        The number of clicks that has been served
     * @param cpc           The cost-per-click
     * @param publisher     The address of the publisher from whom we should credit ether
     * 
     * TODO: have the advertiser's signature also involved.
     */ 
    function chargeAdvertiser (address advertiser, uint clicks, uint cpc, address publisher) onlyOwner public {
        uint cost = clicks * cpc;
        // Bail if the advertiser does not have enough balance.
        if (advertiserBalances[advertiser] - cost <= 0) return;
        // Bail if bitwords takes more than a 30% cut.
        if (bitwordsCutOutof100 > 30) return;
        advertiserBalances[advertiser] -= cost;
        uint publisherCut = cost * (100 - bitwordsCutOutof100) / 100;
        uint bitwordsCut = cost - publisherCut;
        // Send the ether to the publisher and to Bitwords
        publisher.transfer(publisherCut);
        bitwordsWithdrawlAddress.transfer(bitwordsCut);
        // Emit events
        emit PayoutToPublisher(publisher, publisherCut);
        emit DeductFromAdvertiser(advertiser, cost);
    }
}