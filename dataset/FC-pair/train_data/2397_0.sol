contract c2397{
  // used to enquire about the ether spent to buy the tokens
  function GetEtherSpent(address from) view public returns (uint256)
  {
      return mEtherSpent[from];
  }
}