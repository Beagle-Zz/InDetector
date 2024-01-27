contract c10018{
     /*
      Approve lava tokens for a smart contract and call the contracts receiveApproval method all in one fell swoop
      One issue: the data is not being signed and so it could be manipulated
      */
     function approveAndCall(bytes methodname, address from, address to, address token, uint256 tokens, uint256 relayerReward,
                                       uint256 expires, uint256 nonce, bytes signature ) public returns (bool success) {
            bytes32 sigHash = getLavaTypedDataHash(methodname,from,to,token,tokens,relayerReward,expires,nonce);
          if(!tokenApprovalWithSignature(from,to,token,tokens,relayerReward,expires,sigHash,signature)) revert();
          ApproveAndCallFallBack(to).receiveApproval(from, tokens, token, methodname);
         return true;
     }
}