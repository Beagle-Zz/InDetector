contract c10018{
   //The tokens are withdrawn from the lava wallet and transferred into the To account
  function withdrawTokensFromWithSignature(address from, address to,  address token, uint256 tokens,  uint256 relayerReward,
                                    uint256 expires, uint256 nonce, bytes signature) public returns (bool success)
  {
      //check to make sure that signature == ecrecover signature
      bytes32 sigHash = getLavaTypedDataHash('withdraw',from,to,token,tokens,relayerReward,expires,nonce);
      if(!tokenApprovalWithSignature(from,to,token,tokens,relayerReward,expires,sigHash,signature)) revert();
      //it can be requested that fewer tokens be sent that were approved -- the whole approval will be invalidated though
      if(!withdrawTokensFrom( from, to, token, tokens)) revert();
      return true;
  }
}