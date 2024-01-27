contract c10164{
    // Token minting --------------------------------------
    function mintTokens(uint _mint_type, address _account, uint _tokens) public onlyOwner {
        pMintTokens(_mint_type, _account, _tokens, 0);
    }
}