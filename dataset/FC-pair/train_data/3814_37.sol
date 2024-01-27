contract c3814{
  /**
    * transfer from for unlocked accounts
    */
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(locked[_from] < now);
    return super.transferFrom(_from, _to, _value);
  }
}