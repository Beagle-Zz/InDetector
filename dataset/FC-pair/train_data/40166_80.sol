contract c40166{
   
   
  function validate(address currency, uint256 amount) external onlyHotWallet returns (bool) {
    assert(approved[currency] >= amount);
    approved[currency] -= amount;
    return true;
  }
}