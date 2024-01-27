contract c40039{
   
   
   
   
  function mintTokens(address newTokenHolder, uint etherAmount)
    external
    onlyFromWallet {
        uint tokensAmount = currentSwapRate() * etherAmount;
        if(!safeToAdd(_balances[newTokenHolder],tokensAmount )) throw;
        if(!safeToAdd(_supply,tokensAmount)) throw;
        _balances[newTokenHolder] += tokensAmount;
        _supply += tokensAmount;
        TokenMint(newTokenHolder, tokensAmount);
  }
}