contract c8648{
//check how many Ace Tokens a spender is allowed to spend from an owner
function allowance(address _owner, address spender) constant returns (uint _allowance) {
    return _approvals[_owner][spender];
  }
}