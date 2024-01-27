contract c2229{
  /*
    @param _wallet - wallet address of the token sender
    @param _amount - amount of token
    @return true if the transfer is valid
  */
  function allowTransfer(address _wallet, uint256 _amount) internal view returns (bool) {
    Locking memory locking = lockingMap[_wallet];
    if (locking.endTime > now) {
      return balances[_wallet].sub(_amount) >= locking.amount;
    } else {
      return balances[_wallet] >= _amount;
    }
  }
}