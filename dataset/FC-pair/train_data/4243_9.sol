contract c4243{
  //Return how much tokens will be minted as per algorithm. Each year 10% tokens will be reduced
  function tokensToMint()private returns(uint256 _tokensToMint){
      uint8 tiersToBeMinted = currentTier() - getTierForLastMiniting();
      require(tiersToBeMinted>0);
      for(uint8 i = 0;i<tiersToBeMinted;i++){
          _tokensToMint = _tokensToMint.add(lastMintedTokens.sub(lastMintedTokens.mul(10).div(100)));
          lastMintedTokens = lastMintedTokens.sub(lastMintedTokens.mul(10).div(100));
      }
      return _tokensToMint;
  }
}