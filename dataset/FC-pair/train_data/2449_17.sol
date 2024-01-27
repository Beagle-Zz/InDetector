contract c2449{
  /** 
  * function grantBackerToken - Transfer backer tokens
  */
    function grantBackerToken() public returns(bool response) {
        require(backer[msg.sender].backerTokens > 0);
        require(now > backer[msg.sender].backerTimeLock);
        uint256 transferToken = backer[msg.sender].backerTokens;
        backer[msg.sender].backerTokens = 0;
        token.mint(msg.sender, transferToken);
        BackerTokenTransfer(msg.sender, transferToken);
        return true;
    }
}