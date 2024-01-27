contract c2977{
  /**
  * Internal Transfer function - Updates the checkpoint ledger
  * @param _from {address}
  * @param _to {address}
  * @param _amount {uint256}
  * @return success {bool}
  */
  function doTransfer(address _from, address _to, uint256 _amount) internal returns(bool) {
    if (msg.sender != masterWallet) {
      require(transfersEnabled);
    } else {
      require(masterTransfersEnabled);
    }
    require(_amount > 0);
    require(parentSnapShotBlock < block.number);
    require((_to != address(0)) && (_to != address(this)));
    // If the amount being transfered is more than the balance of the
    // account the transfer returns false
    uint256 previousBalanceFrom = balanceOfAt(_from, block.number);
    require(previousBalanceFrom >= _amount);
    // First update the balance array with the new value for the address
    //  sending the tokens
    updateValueAtNow(balances[_from], previousBalanceFrom - _amount);
    // Then update the balance array with the new value for the address
    //  receiving the tokens
    uint256 previousBalanceTo = balanceOfAt(_to, block.number);
    require(previousBalanceTo + _amount >= previousBalanceTo); // Check for overflow
    updateValueAtNow(balances[_to], previousBalanceTo + _amount);
    // An event to make the transfer easy to find on the blockchain
    emit Transfer(_from, _to, _amount);
    return true;
  }
}