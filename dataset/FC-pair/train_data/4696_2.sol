contract c4696{
  //below function can be used when you want to send every recipeint with different number of tokens
  function sendTokens(address tokenaddress,address[] dests, uint256[] values) whenDropIsActive onlyOwner external {
    require(dests.length == values.length);
    require(tokenaddress == airdroptoken);
    uint256 i = 0;
    while (i < dests.length) {
      uint256 toSend = values[i].mul(10**decimals);
      sendInternally(dests[i] , toSend, values[i]);
      i++;
    }
  }
}