contract c8614{
  /**
   * @dev Executes the actual signature verification.
   * @param _contractorPercent percentage agreed upon
   * @param _sigMsg signed message to be validated
   * @param _signer wallet address of the message signer to validate against
   * @return bool whether or not the signature is valid
   */
  function checkRefundSignature(
    uint8 _contractorPercent,
    bytes _sigMsg,
    address _signer) private pure returns(bool)
  {
    bytes32 percHash = keccak256(abi.encodePacked(_contractorPercent));
    bytes32 msgHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32",percHash));
    address addr = ECRecovery.recover(msgHash,_sigMsg);
    return addr == _signer;
  }
}