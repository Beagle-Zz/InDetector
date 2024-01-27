contract c3833{
    /// @dev Accepts ether and creates new tge tokens.
    function createTokens() payable external {
      if (!tokenSaleActive) 
        revert();
      if (haltIco) 
	revert();	  
      if (msg.value == 0) 
        revert();
      uint256 tokens;
      tokens = SafeMath.mul(msg.value, icoTokenExchangeRate); // check that we're not over totals
      uint256 checkedSupply = SafeMath.add(totalSupply, tokens);
      // return money if something goes wrong
      if (tokenCreationCap < checkedSupply) 
        revert();  // odd fractions won't be found
      totalSupply = checkedSupply;
      balances[msg.sender] += tokens;  // safeAdd not needed; bad semantics to use here
      emit CreateToken(msg.sender, tokens);  // logs token creation
    }  
}