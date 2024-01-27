contract c4184{
/**
Set the king to the Ethereum Address which is encoded as 160 bits of the 256 bit mining nonce
**/
//proxyMintWithKing
   function mintForwarder(uint256 nonce, bytes32 challenge_digest, address proxyMinter) returns (bool)
   {
      bytes memory nonceBytes = uintToBytesForAddress(nonce);
      address newKing = bytesToAddress(nonceBytes);
      uint previousEpochCount = ERC918Interface(minedToken).epochCount();
      //Forward to another contract, typically a pool's owned  mint contract
      require(proxyMinterInterface(proxyMinter).proxyMint(nonce, challenge_digest));
     //make sure that the minedToken really was proxy minted through the proxyMint delegate call chain
      require(  ERC918Interface(minedToken).epochCount() == previousEpochCount.add(1) );
      miningKing = newKing;
      return true;
   }
}