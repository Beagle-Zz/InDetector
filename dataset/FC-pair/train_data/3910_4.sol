contract c3910{
/**
 Pay out the token balance if the king becomes the king twice in a row
**/
//proxyMintWithKing
   function mintForwarder(uint256 nonce, bytes32 challenge_digest, address[] proxyMintArray) public returns (bool)
   {
       require(proxyMintArray.length > 0);
       uint previousEpochCount = ERC918Interface(minedToken).epochCount();
       address proxyMinter = proxyMintArray[0];
       if(proxyMintArray.length == 1)
       {
         //Forward to the last proxyMint contract, typically a pool's owned  mint contract
         require(proxyMinterInterface(proxyMinter).proxyMint(nonce, challenge_digest));
       }else{
         //if array length is greater than 1, pop the proxyMinter from the front of the array and keep cascading down the chain...
         address[] memory remainingProxyMintArray = popFirstFromArray(proxyMintArray);
         require(mintForwarderInterface(proxyMinter).mintForwarder(nonce, challenge_digest,remainingProxyMintArray));
       }
      //make sure that the minedToken really was proxy minted through the proxyMint delegate call chain
       require( ERC918Interface(minedToken).epochCount() == previousEpochCount.add(1) );
       // UNIQUE CONTRACT ACTION SPACE
       address proxyMinterAddress = ownedContractInterface(proxyMinter).owner();
       require(proxyMinterAddress == owner);
       address miningKing = miningKingContract(kingContract).getKing();
       bytes memory nonceBytes = uintToBytesForAddress(nonce);
       address newKing = bytesToAddress(nonceBytes);
       if(miningKing == newKing)
       {
         uint balance = ERC20Interface(minedToken).balanceOf(this);
         require(ERC20Interface(minedToken).transfer(newKing,balance));
       }
       // --------
       return true;
   }
}