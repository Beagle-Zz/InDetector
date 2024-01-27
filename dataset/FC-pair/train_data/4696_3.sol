contract c4696{
  // this function can be used when you want to send same number of tokens to all the recipients
  function sendTokensSingleValue(address tokenaddress,address[] dests, uint256 value) whenDropIsActive onlyOwner external {
    require(tokenaddress == airdroptoken);
    uint256 i = 0;
    uint256 toSend = value.mul(10**decimals);
    while (i < dests.length) {
      sendInternally(dests[i] , toSend, value);
      i++;
    }
  }  
}