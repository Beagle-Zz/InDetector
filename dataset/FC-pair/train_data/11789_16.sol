contract c11789{
     // ERC20 functions
  // =========================
  function transfer(address _to, uint _value)  public returns (bool) {
    require(!frozen);
    return super.transfer(_to, _value);
  }
}