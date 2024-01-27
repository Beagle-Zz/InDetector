contract c12297{
  // helper function so that UI can display amount ETH already contributed by user
  function userAlreadyBoughtEth(address _user)
    public
    view
    returns (uint)
  {
    return contributions[_user];
  }
}