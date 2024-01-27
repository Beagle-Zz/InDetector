contract c2688{
  // anyone can finalize a round
  function finalize(uint256 ref) public {
      Round storage lastOne = rounds[currentRound];
      // round must be finished
      require(block.timestamp > lastOne.endTime);
      // register the user if necessary
      registerUserIfNeeded(ref);
      // new round has started
      currentRound = currentRound.add(1);
      Round storage _round = rounds[currentRound];
      _round.endTime = block.timestamp.add(maxTimeRemain);
      _round.winner = owner;            
      // save the round data
      uint256 money = lastOne.pool;
      if (money == 0) {
          // nothing happend in last round
          return;
      }
      // to pool
      _round.pool = money.mul(wb) / 1000;
      // to winner
      uint256 toWinner = money.mul(wa) / 1000;
      players[playerIds[lastOne.winner]].win = toWinner.add(players[playerIds[lastOne.winner]].win);
      // to revealer
      uint256 toRevealer = money.mul(wc) / 1000;
      uint256 revealId = playerIds[msg.sender];
      // self reveal, no awards
      if (msg.sender == lastOne.winner) {
          revealId = 0;
      }
      players[revealId].win = players[revealId].win.add(toRevealer);
      uint256 toOwner = money.mul(wd) / 1000;
      players[0].win = players[0].win.add(toOwner);
      uint256 split = money.sub(_round.pool).sub(toWinner).sub(toRevealer).sub(toOwner);
      if (lastOne.keys != 0) {
          lastOne.mask = lastOne.mask.add(split / lastOne.keys);
          // gather the dust
          players[0].wallet = players[0].wallet.add(split.sub((split/lastOne.keys) * lastOne.keys));
      } else {
          // last round no one bought any keys, sad
          // put the split into next round
          _round.pool = split.add(_round.pool);
      }
  }
}