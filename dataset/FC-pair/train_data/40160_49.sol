contract c40160{
  /**
   * @notice Approve Approves spender `_spender` to transfer `_amount` from `_caller`
   *
   * @param _caller Address that grants the allowance
   * @param _spender Address that receives the cheque
   * @param _amount Amount on the cheque
   * @return result of the method call
   */
  function assent(address _a, address _b, uint256 _c) onlyAsset returns (bool success) {
    assert(allowTransactions);
    assert(!frozenAccount[_a]);
    allowance[_a][_b] = _c;
    activateAccount(_a);
    activateAccount(_b);
    activateAllowanceRecord(_a, _b);
    Approval(_a, _b, _c);
    return true;
  }
}