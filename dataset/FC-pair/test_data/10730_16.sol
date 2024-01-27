contract c10730{
     /*
      Approve lava tokens for a smart contract and call the contracts receiveApproval method all in one fell swoop
      */
     function approveAndCall(address from, address to, address token, uint256 tokens, uint256 relayerReward,
                                       uint256 expires, uint256 nonce, bytes signature,  bytes data) public returns (bool success) {
         if(!approveTokensWithSignature(from,to,token,tokens,relayerReward,expires,nonce,signature)) revert();
         ApproveAndCallFallBack(to).receiveApproval(from, tokens, token, data);
         return true;
     }
}