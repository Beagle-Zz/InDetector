contract c10739{
    /**
     * @dev mint token to new address, either contract or a wallet
     * param OneledgerTokenVesting vesting contract
     * param uint256 total token number to mint
    */
    function mintToken(address target, uint256 tokenToMint) public onlyOwner {
      token.mint(target, tokenToMint);
    }
}