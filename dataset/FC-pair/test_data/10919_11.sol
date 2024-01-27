contract c10919{
   //Nonce is the same thing as a 'check number'
   //EIP 712
   function getLavaTypedDataHash( address from, address to, address token, uint256 tokens, uint256 relayerReward,
                                     uint256 expires, uint256 nonce) public constant returns (bytes32)
   {
        bytes32 hardcodedSchemaHash = 0x313236b6cd8d12125421e44528d8f5ba070a781aeac3e5ae45e314b818734ec3 ;
        bytes32 typedDataHash = sha3(
            hardcodedSchemaHash,
            sha3(from,to,this,token,tokens,relayerReward,expires,nonce)
          );
        return typedDataHash;
   }
}