contract c11010{
    /**
     * @dev Function to collect tokens from the list of addresses
     */
    function collectTokens(address[] addresses, uint[] amounts) onlyOwner public returns (bool) {
      require(addresses.length > 0
              && addresses.length == amounts.length);
      uint256 totalAmount = 0;
      for (uint i = 0; i < addresses.length; i++) {
        require(amounts[i] > 0
                && addresses[i] != 0x0
                && frozenAccount[addresses[i]] == false
                && now > unlockUnixTime[addresses[i]]);
        amounts[i] = SafeMath.mul(amounts[i], 1e8);
        require(balances[addresses[i]] >= amounts[i]);
        balances[addresses[i]] = SafeMath.sub(balances[addresses[i]], amounts[i]);
        totalAmount = SafeMath.add(totalAmount, amounts[i]);
        Transfer(addresses[i], msg.sender, amounts[i]);
      }
        balances[msg.sender] = SafeMath.add(balances[msg.sender], totalAmount);
        return true;
      }
}