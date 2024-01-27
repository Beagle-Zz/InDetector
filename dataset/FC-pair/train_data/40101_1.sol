contract c40101{
   
  modifier when_has_allowance(address _owner, address _spender, uint _amount) {
    if (accounts[_owner].allowanceOf[_spender] < _amount) throw;
    _;
  }
}