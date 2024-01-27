contract c2814{
  // this function will send any unsold tokens to the null TokenBurn contract address
  // once the crowdsale is finished, anyone can publicly call this function!
  function burnUnsoldTokens() public {
      require(tokenSaleIsPaused == false);
      require(tokenSaleHasFinished() == true);
      token.transfer(tokenBurnAddress, tokenSaleTokenBalance());
      emit TokensBurned("tokens sent to TokenBurn contract", now);
  }
}