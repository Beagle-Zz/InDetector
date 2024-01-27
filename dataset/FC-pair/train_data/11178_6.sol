contract c11178{
/** *********************** Player Administrative ************************** **/
  /**
  * @dev Used by posters to submit and create a new meme.
  */
  function createToken() external payable {
    // make sure token hasn't been used yet
    uint256 tokenId = totalTokens + 1;
    require(memeData[tokenId].price == 0);
    require(msg.value == submissionPrice);
    submissionPool += submissionPrice;
    endingBalance = address(this).balance;
    // create new token
    memeData[tokenId] = Meme(1 ether / 100, msg.sender, msg.sender);
    // mint new token
    _mint(msg.sender, tokenId);
    emit Creation(msg.sender, tokenId, block.timestamp);
  }
}