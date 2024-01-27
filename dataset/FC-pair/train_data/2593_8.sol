contract c2593{
  // Token fallback to bet or deposit from bankroll
  function tokenFallback(address _from, uint _value, bytes _data) public returns (bool) {
    if (_from == ZethrBankroll) {
      // Update the contract balance
      contractBalance = contractBalance.add(_value);
      // Update the maximum profit
      uint oldMaxProfit = maxProfit;
      setMaxProfit();
      emit MaxProfitChanged(oldMaxProfit, maxProfit);
      return true;
    } else {
      TKN memory _tkn;
      _tkn.sender = _from;
      _tkn.value = _value;
      uint8 chosenNumber = uint8(_data[0]);
      _playerRollDice(chosenNumber, _tkn);
    }
    return true;
  }
}