contract c2977{
  /**
  * Standard ERC20 approve function
  * @param _spender {address}
  * @param _amount {uint256}
  * @return success {bool}
  */
  function approveAndCall(address _spender, uint256 _amount, bytes _extraData) public returns (bool success) {
    approve(_spender, _amount);
    ApproveAndCallReceiver(_spender).receiveApproval(
        msg.sender,
        _amount,
        this,
        _extraData
    );
    return true;
  }
}