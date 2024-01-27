contract c13676{
  //allow owner to transfer surplus
  function ownerTransfer(address to, uint value)
    public
    onlyOwner
  {
    uint current_balance_all = 0;
    for (uint i = 0; i < accounts.length; i++)
      current_balance_all += account_data[accounts[i]].current_balance;
    require(getBalance() > current_balance_all && value <= getBalance() - current_balance_all);
    if (we_test_token.transfer(to, value))
      emit OwnerTransfer(to, value);
  }
}