contract c40166{
   
  modifier spendControl(address currency, uint256 amount) {
    assert(Oversight(oversightAddress).validate(currency, amount));
    _;
  }
}