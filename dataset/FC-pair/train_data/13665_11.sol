contract c13665{
    /**
    * @notice transfers the token specified from sneder address to receiver address.
    * @param fromAddress the sender address that initially holds the token.
    * @param toAddress the receipient of the token.
    * @param tokenId ID of the token that will be sent.
    */
    function _transfer(address fromAddress, address toAddress, uint256 tokenId) internal {
      require(tokensOfOwnerMap[toAddress].length < 100);
      require(pValidationState == pointsValidationState.Unstarted);
      tokensOfOwnerMap[toAddress].push(tokenId);
      ownerOfTokenMap[tokenId] = toAddress;
      uint256[] storage tokenArray = tokensOfOwnerMap[fromAddress];
      for (uint256 i = 0; i < tokenArray.length; i++){
        if(tokenArray[i] == tokenId){
          tokenArray[i] = tokenArray[tokenArray.length-1];
        }
      }
      delete tokenArray[tokenArray.length-1];
      tokenArray.length--;
      delete tokensApprovedMap[tokenId];
    }
}