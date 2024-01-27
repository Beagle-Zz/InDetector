contract c2814{
  // check the token balance of any ethereum address  
  function getAnyAddressTokenBalance(address _address) public view returns(uint) {
      return token.balanceOf(_address);
  }
}