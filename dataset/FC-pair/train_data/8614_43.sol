contract c8614{
  /**
   * @dev Helper function to pre-validate mutual cancellation signatures. Used by front-end app
   * to let each party know that the other has signed off the agreed %
   * @param _contractorPercent percentage agreed upon
   * @param _sigMsg signed message to be validated
   * @param _signer wallet address of the message signer to validate against
   * @return bool whether or not the signature is valid
   */
  function validateRefundSignature(
    uint8 _contractorPercent,
    bytes _sigMsg,
    address _signer) external pure returns(bool)
  {
    return checkRefundSignature(_contractorPercent,_sigMsg,_signer);
  }
}