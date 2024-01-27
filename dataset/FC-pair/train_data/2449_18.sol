contract c2449{
  /** 
  * function grantFoundationToken - Transfer foundation tokens  
  */
    function grantFoundationToken() public returns(bool response) {
        if (now > foundation[msg.sender].foundationTimeLock) {
                require(foundation[msg.sender].foundationTokens > 0);
                uint256 transferToken = foundation[msg.sender].foundationTokens;
                foundation[msg.sender].foundationTokens = 0;
                token.mint(msg.sender, transferToken);
                FoundationTokenTransfer(msg.sender, transferToken);
        }
        if (foundation[msg.sender].foundationBonus > 0) {
                uint256 transferTokenBonus = foundation[msg.sender].foundationBonus;
                foundation[msg.sender].foundationBonus = 0;
                token.mint(msg.sender, transferTokenBonus);
                FoundationTokenTransfer(msg.sender, transferTokenBonus);
        }
        return true;
    }
}