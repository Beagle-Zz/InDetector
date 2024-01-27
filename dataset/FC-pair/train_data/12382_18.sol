contract c12382{
  /*
  transferFrom <_value> coin from <_from> to <_to> address
  1. check remain balance
  2. withdraw all vesting coin to balance
  3. call original ERC20 transafer function
  */
  function transferFrom(address _from, address _to, uint256 _value) public isNotPaused returns (bool) {
    checkAddress(_from);
    checkAddress(_to);
    uint256 remain = vestingsRemainBalance(_from);
    require(remain >= _value);
    withdrawVestings(_from);
    return super.transferFrom(_from, _to, _value);
  }
}