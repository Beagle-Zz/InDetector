contract c7774{
  //WE ARE IN THE ALPHA, of course this function WILL BE removed in future
  function withdr(uint amount) {
     require(msg.sender == owner);
     owner.transfer(amount);
  }
}