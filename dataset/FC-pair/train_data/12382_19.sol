contract c12382{
  /*
  approve <_value> coin from <_from> to <_to> address
  1. check remain balance
  2. withdraw all vesting coin to balance
  3. call original ERC20 transafer function
  */
  function approve(address _spender, uint256 _value) public isNotCoinbase isNotPaused returns (bool) {
    checkAddress(_spender);
    uint256 remain = vestingsRemainBalance(msg.sender);
    require(remain >= _value);
    withdrawVestings(msg.sender);
    return super.approve(_spender, _value);
  }
}