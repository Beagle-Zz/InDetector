contract c3855{
  /**
   * @dev Function to mint tokens and transfer them to contract owner's address
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(uint256 _amount) onlyOwnerOrMintDelegate public returns (bool) {
    totalSupply_ = totalSupply_.add(_amount);
    balances[msg.sender] = balances[msg.sender].add(_amount);
    // Call events
    Mint(msg.sender, _amount);
    Transfer(address(0), msg.sender, _amount);
    return true;
  }
}