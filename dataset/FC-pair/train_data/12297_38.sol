contract c12297{
  // helper function so that UI can display amount ETH user can still contribute
  function userCanStillBuyEth(address _user)
    external
    view
    returns (uint)
  {
    return MAX_PURCHASE.sub(userAlreadyBoughtEth(_user));
  }
}