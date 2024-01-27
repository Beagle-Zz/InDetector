contract c8855{
     // @title burn allows the administrator to burn their own tokens
     // @param _value is the number of tokens to burn
     // @dev note that admin can only burn their own tokens
     function burn(uint256 _value) external onlyOwner {
         require(_value > 0 && balances[msg.sender] >= _value);
         totalSupply.sub(_value);
         balances[msg.sender].sub(_value);
         emit Burn(msg.sender, _value);
     }
}