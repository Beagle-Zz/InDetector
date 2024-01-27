contract c2229{
  /*
    transfer token from sender to receiver 
    @param _from - wallet address of the token sender
    @param _to - wallet address of the token receiver
    @param _value - amount of token to be transferred
    @return true if the transfer is done
  */
  function transferFrom(address _from, address _to, uint256 _value)  onlyPayloadSize(3 * 32) public returns (bool) {
    require(allowTransfer(_from, _value));
    return super.transferFrom(_from, _to, _value);
  }
}