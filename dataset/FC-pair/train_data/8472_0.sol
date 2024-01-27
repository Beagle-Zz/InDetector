contract c8472{
//retrieve number of all ACE Equity Tokens in existence
function totalSupply() public constant returns (uint supply) {
    return _supply;
  }
}