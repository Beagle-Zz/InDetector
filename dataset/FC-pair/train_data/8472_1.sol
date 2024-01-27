contract c8472{
//check ACE Equity Tokens balance of an Ethereum account
function balanceOf(address who) public constant returns (uint value) {
    return _balances[who];
  }
}