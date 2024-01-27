contract c18298{
  /**
   * For future use only whne we will need more tokens for our main application
   * Create mintedAmount new tokens and give new created tokens to target.
   * May only be called by smart contract owner.
   * @param mintedAmount number of tokens to create
   * @return true if tokens were created successfully, false otherwise
   */
  function mintToken(address target, uint256 mintedAmount) 
  returns (bool success) {
    require (msg.sender == owner);
      if (mintedAmount > 0) {
      accounts [target] = safeAdd (accounts [target], mintedAmount);
      tokenCount = safeAdd (tokenCount, mintedAmount);
	  // adding transfer event and _from address as null address
	  Transfer(0x0, target, mintedAmount);
	   return true;
    }
	  return false;
    }
}