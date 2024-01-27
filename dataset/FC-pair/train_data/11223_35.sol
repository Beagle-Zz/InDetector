contract c11223{
  /**
  * @dev Withdraw tokens after the window has closed
  * @param window to withdraw 
  * @return the calculated number of tokens
  */
  function withdraw(uint256 window) public returns (uint256 reward) {
    // Requested window already been closed
    require(window < currentWindow());
    // The sender hasn't made a commitment for requested window
    if (commitment[msg.sender][window] == 0) {
      return 0;
    }
    // The Price for given window is allocation / total_commitment
    // uint256 price = allocationFor(window).div(totals[window]);
    // The reward is price * commitment
    // uint256 reward = price.mul(commitment[msg.sender][window]);
    // Same calculation optimized for accuracy (without the .div rounding for price calculation):
    reward = allocationFor(window).mul(commitment[msg.sender][window]).div(totals[window]);
    // Init the commitment
    commitment[msg.sender][window] = 0;
    // Transfer the tokens
    MCoin.transfer(msg.sender, reward);
    // Log
    emit Withdraw(msg.sender, reward, window);
    return reward;
  }
}