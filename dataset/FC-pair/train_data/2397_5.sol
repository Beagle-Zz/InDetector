contract c2397{
  // in the light of our sanity allow a utility to whole number of tokens and 1/10000 token transfer
  function simpletransfer(address _to, uint256 _whole, uint256 _fraction) public returns (bool success) 
  {
    require(_fraction<10000);//, "Fractional part must be less than 10000");
    uint256 main = _whole.mul(10**decimals); // works fine now i've removed the retarded divide by 0 assert in safemath
    uint256 part = _fraction.mul(10**14);
    uint256 value = main + part;
    // just call the transfer
    return transfer(_to, value);
  }
}