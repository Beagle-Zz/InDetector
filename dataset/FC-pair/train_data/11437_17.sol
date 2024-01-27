contract c11437{
  // functions overrides in order to maintain the token locked during the ICO
  function transfer(address _to, uint256 _value) public returns(bool) {
    require(state == State.Transferable);
    return super.transfer(_to,_value);
  }
}