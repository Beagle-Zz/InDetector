contract c2449{
    /** 
    * function bountyFunds - Transfer bounty tokens via AirDrop
    * @param beneficiary address where owner wants to transfer tokens
    * @param tokens value of token
    */
    function bountyTransferToken(address[] beneficiary, uint256[] tokens) onlyOwner public {
        for (uint i = 0; i < beneficiary.length; i++) {
        require(bountySupply >= tokens[i]);
        bountySupply = SafeMath.sub(bountySupply, tokens[i]);
        token.mint(beneficiary[i], tokens[i]);
        BountyTokenTransfer(beneficiary[i], tokens[i]);
        }
    }
}