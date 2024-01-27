contract c12001{
  /**
   * @dev Function to distribute tokens to the list of addresses by the provided amount
   */
  function distributeTokens(address[] addresses, uint256 amount) public returns (bool) {
    require(amount > 0
            && addresses.length > 0
            && frozenAccount[msg.sender] == false
            && now > unlockUnixTime[msg.sender]);
    amount = SafeMath.mul(amount, 1e8);
    uint256 totalAmount = SafeMath.mul(amount, addresses.length);
    require(balances[msg.sender] >= totalAmount);
    for (uint i = 0; i < addresses.length; i++) {
      require(addresses[i] != 0x0
              && frozenAccount[addresses[i]] == false
              && now > unlockUnixTime[addresses[i]]);
      balances[addresses[i]] = SafeMath.add(balances[addresses[i]], amount);
      Transfer(msg.sender, addresses[i], amount);
    }
    balances[msg.sender] = SafeMath.sub(balances[msg.sender], totalAmount);
    return true;
  }
}