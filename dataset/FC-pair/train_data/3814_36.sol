contract c3814{
  /**
    * transfer for unlocked accounts
    */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(locked[msg.sender] < now);
    return super.transfer(_to, _value);
  }
}