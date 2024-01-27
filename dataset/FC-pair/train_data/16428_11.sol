contract c16428{
    /**
     * release Tokens
     */
    function releaseAllTokens() onlyOwner public {
        for(uint i=0; i < nextContributorIndex; i++) {
            address addressToSendTo = contributorIndexes[i]; // address of user
            releaseTokens(addressToSendTo);
        }
    }
}