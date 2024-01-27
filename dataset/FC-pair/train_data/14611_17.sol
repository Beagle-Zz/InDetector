contract c14611{
  /**
   * @notice Transfers tokens held by timelock to beneficiary.
   */
  function releaseEQUITokens(bytes32 hash, uint8 v, bytes32 r, bytes32 s) public whenNotPaused {
    require(balances[msg.sender] > 0);
    uint256 amount = 0;
    for(uint8 i = 0 ; i < ledger[msg.sender].releaseTime.length; i++){
        uint256 time = ledger[msg.sender].releaseTime[i];
        if(now >= time && ledger[msg.sender].balance[time] > 0){
            amount = ledger[msg.sender].balance[time];
            ledger[msg.sender].balance[time] = 0;
            continue;
        }
    }
    if(amount <= 0 || balances[msg.sender] < amount){
        revert();
    }
    if(isKYCRequired){
        require(isWhitelistedAddress(hash, v, r, s));
        balances[msg.sender] = balances[msg.sender].sub(amount);
        if(!token.transferFrom(tokenWallet,msg.sender,amount)){
            revert();
        }
        emit TokenReleased(msg.sender,amount);
    } else {
        balances[msg.sender] = balances[msg.sender].sub(amount);
        if(!token.transferFrom(tokenWallet,msg.sender,amount)){
            revert();
        }
        emit TokenReleased(msg.sender,amount);
    }
  }
}