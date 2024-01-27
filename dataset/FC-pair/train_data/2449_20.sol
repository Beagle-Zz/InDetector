contract c2449{
  /** 
  * function grantPrivatePurchaserToken - Transfer Private Purchasers tokens
  */
    function grantPrivatePurchaserToken() public returns(bool response) {
        if (now > privatePurchaser[msg.sender].privatePurchaserTimeLock) {
                require(privatePurchaser[msg.sender].privatePurchaserTokens > 0);
                uint256 transferToken = privatePurchaser[msg.sender].privatePurchaserTokens;
                privatePurchaser[msg.sender].privatePurchaserTokens = 0;
                token.mint(msg.sender, transferToken);
                PrivatePurchaserTokenTransfer(msg.sender, transferToken);
        }
        if (privatePurchaser[msg.sender].privatePurchaserBonus > 0) {
                uint256 transferBonusToken = privatePurchaser[msg.sender].privatePurchaserBonus;
                privatePurchaser[msg.sender].privatePurchaserBonus = 0;
                token.mint(msg.sender, transferBonusToken);
                PrivatePurchaserTokenTransfer(msg.sender, transferBonusToken);
        }
        return true;
    }
}