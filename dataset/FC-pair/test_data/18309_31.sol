contract c18309{
   /**
   * @dev Allows anyone to create tokens by depositing ether.
   * @param recipient the recipient to receive tokens. 
   */
  function createTokens(address recipient) saleIsOn payable {
    uint256 sum;
    uint256 halfSum;  
    uint256 quatSum; 
    uint256 rate;
    uint256 tokens;
    uint256 restrictedTokens;
    uint256 tok1;
    uint256 tok2;
    require( msg.value > 0 );
    sum = msg.value;
    halfSum = sum.div(2);
    quatSum = halfSum.div(2);
    rate = exchangeRate.getRate("ETH"); 
    tokens = rate.mul(sum).div(1 ether);
    require( tokens > 0 );
    token.mint(recipient, tokens);
    multisigVaultFirst.transfer(halfSum);
    multisigVaultSecond.transfer(quatSum);
    multisigVaultThird.transfer(quatSum);
    /*
    * "dev Create restricted tokens
    */
    restrictedTokens = tokens.mul(restrictedPercent).div(100 - restrictedPercent);
    tok1 = restrictedTokens.mul(60).div(100);
    tok2 = restrictedTokens.mul(40).div(100);
    require (tok1 + tok2==restrictedTokens );
    token.mint(restricted, tok1);
    token.mint(restrictedAdditional, tok2);
    emit TokenSold(recipient, msg.value, tokens, rate);
  }
}