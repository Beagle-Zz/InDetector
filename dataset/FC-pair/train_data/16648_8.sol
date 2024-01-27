contract c16648{
  // Return all the game constants, setting the game
  function getGameConstants() public view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256[]) {
    return (
        timeBetweenGames,
        timeBeforeJackpot,
        minMinBuyETH,
        minMaxBuyETH,
        minBuy,
        maxBuy,
        gameReseeds
      );
  }
}