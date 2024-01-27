contract c3828{
   //Nonce is the same thing as a 'check number'
   //EIP 712
   function getLavaTypedDataHash(bytes methodname, address from, address to, address token, uint256 tokens, uint256 relayerReward,
                                     uint256 expires, uint256 nonce) public constant returns (bytes32)
   {
         bytes32 hardcodedSchemaHash = 0x8fd4f9177556bbc74d0710c8bdda543afd18cc84d92d64b5620d5f1881dceb37; //with methodname
        bytes32 typedDataHash = sha3(
            hardcodedSchemaHash,
            sha3(methodname,from,to,this,token,tokens,relayerReward,expires,nonce)
          );
        return typedDataHash;
   }
}