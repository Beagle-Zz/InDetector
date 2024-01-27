contract c18043{
    /*
     * If tokens left make a priveledge token sale for contributor that are already validated
     * make a new date time for left tokens only for priveledge whitelisted
     * If not enouhgt tokens left for a sale send directly to locked contract/ vault
     */
    function seedSaleTokenLeft(address _tokenContract) public onlyOwner {
        require(seedEnded());
        uint256 amountLeft = pendingUFT.sub(concludeUFT);
        token.transferFromVault(token, _tokenContract, amountLeft );
    }
}