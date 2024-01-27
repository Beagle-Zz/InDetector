contract c16410{
  // overriding StandardToken#approve
  function approve(address _spender, uint256 _value) public returns (bool) {
    require(whitelistAddresses[msg.sender] > 0);
    require(now >= whitelistAddresses[msg.sender]);
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }
}