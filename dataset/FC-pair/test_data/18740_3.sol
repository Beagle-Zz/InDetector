contract c18740{
  /// @dev withdraw loot tokens
  /// @param _amountSKL the amount of SKL tokens to withdraw
  /// @param _amountXP them amount of XP tokens to withdraw
  /// @param _amountGold them amount of Gold tokens to withdraw
  /// @param _amountSilver them amount of Silver tokens to withdraw
  /// @param _amountScale them amount of Scale tokens to withdraw
  /// @param _nonce incremental index of withdrawal
  /// @param _v ECDCA signature
  /// @param _r ECDSA signature
  /// @param _s ECDSA signature
  function receiveTokenLoot(uint _amountSKL, 
                            uint _amountXP, 
                            uint _amountGold, 
                            uint _amountSilver,
                            uint _amountScale,
                            uint _nonce, 
                            uint8 _v, 
                            bytes32 _r, 
                            bytes32 _s) {
    // reject if the new nonce is lower or equal to the current one
    require(_nonce > nonces[msg.sender]);
    nonces[msg.sender] = _nonce;
    // verify signature
    address signer = ecrecover(keccak256(msg.sender, 
                                         _amountSKL, 
                                         _amountXP, 
                                         _amountGold,
                                         _amountSilver,
                                         _amountScale,
                                         _nonce), _v, _r, _s);
    require(signer == neverdieSigner);
    // transer tokens
    if (_amountSKL > 0) assert(sklToken.transfer(msg.sender, _amountSKL));
    if (_amountXP > 0) assert(xpToken.transfer(msg.sender, _amountXP));
    if (_amountGold > 0) assert(goldToken.transfer(msg.sender, _amountGold));
    if (_amountSilver > 0) assert(silverToken.transfer(msg.sender, _amountSilver));
    if (_amountScale > 0) assert(scaleToken.transfer(msg.sender, _amountScale));
    // emit event
    ReceiveLoot(msg.sender, _amountSKL, _amountXP, _amountGold, _amountSilver, _amountScale, _nonce);
  }
}