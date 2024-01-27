contract c7365{
   /**
   * @notice This function is modified for erc223 standard
   * @dev ERC20 transfer function added for backward compatibility.
   * @param _to Address of token receiver
   * @param _value Number of tokens to send
   */
   function transfer(address _to, uint256 _value) external returns (bool) {
     require(_to != address(0));
     require(_value <= balances[msg.sender] && balances[_to] + _value >= balances[_to]);
     require(!isContract(_to));
     balances[msg.sender] = balances[msg.sender].sub(_value);
     balances[_to] = balances[_to].add(_value);
     emit Transfer(msg.sender, _to, _value);
     return true;
   }
}