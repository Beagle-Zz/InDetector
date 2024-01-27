contract c2449{
        /** 
    * function publicTransferToken - Transfer public tokens via AirDrop
    * @param beneficiary address where owner wants to transfer tokens
    * @param tokens value of token
    */
    function publicTransferToken(address[] beneficiary, uint256[] tokens) onlyOwner public {
        for (uint i = 0; i < beneficiary.length; i++) {
        require(publicSupply >= tokens[i]);
        publicSupply = SafeMath.sub(publicSupply,tokens[i]);
        token.mint(beneficiary[i], tokens[i]);
        PublicTokenTransfer(beneficiary[i], tokens[i]);
        }
    }
}