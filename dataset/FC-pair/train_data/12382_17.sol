contract c12382{
  /*
  transfer <_value> coin from <msg.sender> to <_to> address
  1. check remain balance
  2. withdraw all vesting coin to balance
  3. call original ERC20 transafer function
  */
  function transfer(address _to, uint256 _value) public isNotCoinbase isNotPaused returns (bool) {
    checkAddress(_to);
    uint256 remain = vestingsRemainBalance(msg.sender);
    require(remain >= _value);
    withdrawVestings(msg.sender);
    return super.transfer(_to, _value);
  }
}