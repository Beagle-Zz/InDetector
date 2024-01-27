contract c2449{
  /** 
  * function grantFounderToken - Transfer founder tokens  
  */
    function grantFounderToken() public returns(bool response) {
        require(founder[msg.sender].founderTokens > 0);
        require(now > founder[msg.sender].founderTimeLock);
        uint256 transferToken = founder[msg.sender].founderTokens;
        founder[msg.sender].founderTokens = 0;
        token.mint(msg.sender, transferToken);
        FounderTokenTransfer(msg.sender, transferToken);
        return true;
    }
}