contract c10908{
//freeze  or unfreeze account
  function freezeAccount(address target, bool freeze) public onlyOwner {
    require(target != address(0));
    frozenAccount[target] = freeze;
    emit FrozenFunds(target, freeze);
 }
}