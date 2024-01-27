contract c13632{
  /* For operators */
  function setHash (uint256 gameId, bytes32 hash) public whenNotPaused restricted {
    Shuffle storage game = games[gameId];
    if (game.hash != bytes32(0)) revert();
    game.hash = hash;
    emit NewHash(game.id);
  }
}