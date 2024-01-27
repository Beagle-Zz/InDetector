contract c2814{
  // function to temporarily pause token sale if needed
  function pauseTokenSale() onlyAdmin public {
      // confirm the token sale hasn't already completed
      require(tokenSaleHasFinished() == false);
      // confirm the token sale isn't already paused
      require(tokenSaleIsPaused == false);
      // pause the sale and note the time of the pause
      tokenSaleIsPaused = true;
      tokenSalePausedTime = now;
      emit SalePaused("token sale has been paused", now);
  }
}