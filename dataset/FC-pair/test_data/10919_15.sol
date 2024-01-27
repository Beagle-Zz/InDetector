contract c10919{
       /*
         Receive approval to spend tokens and perform any action all in one transaction
       */
     function receiveApproval(address from, uint256 tokens, address token, bytes data) public returns (bool success) {
       return depositTokens(from, token, tokens );
     }
}