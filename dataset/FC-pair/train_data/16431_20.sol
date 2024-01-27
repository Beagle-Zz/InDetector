contract c16431{
  /**
     * auto refund Tokens
     */
    function refundAllMoney() onlyOwner public {
        for(uint i=0; i < nextContributorIndex; i++) {
            address addressToSendTo = contributorIndexes[i];
            refundMoney(addressToSendTo); 
        }
    }
}