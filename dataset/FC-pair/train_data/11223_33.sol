contract c11223{
  /**
  * @dev commit funds for a given window
  * Tokens for commited window need to be withdrawn after
  * window closes using withdraw(uint256 window) function
  * first window: 0
  * last window: totalWindows - 1
  * @param window to commit [0-totalWindows)
  */
  function commitOn(uint256 window) public payable {
    // Distribution didn't ended
    require(currentWindow() < totalWindows);
    // Commit only for present or future windows
    require(currentWindow() <= window);
    // Don't commit after distribution is finished
    require(window < totalWindows);
    // Minimum commitment
    require(0.01 ether <= msg.value);
    // Add commitment for user on given window
    commitment[msg.sender][window] = commitment[msg.sender][window].add(msg.value);
    // Add to window total
    totals[window] = totals[window].add(msg.value);
    // Log
    emit Commit(msg.sender, msg.value, window);
  }
}