contract c7007{
  /*
    Airdrop function which take up a array of address,token amount and eth amount and call the
    transfer function to send the token plus send eth to the address is balance is 0
   */
  function doAirDrop(address[] _address, uint256[] _amount, uint256 _ethAmount) onlyOwner public returns (bool) {
    uint256 count = _address.length;
    for (uint256 i = 0; i < count; i++)
    {
      /* calling transfer function from contract */
      tokenInstance.transfer(_address [i],_amount [i]);
      if((_address [i].balance == 0) && (this.balance >= _ethAmount))
      {
        require(_address [i].send(_ethAmount));
      }
    }
  }
}