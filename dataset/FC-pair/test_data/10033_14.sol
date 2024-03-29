contract c10033{
  /**
   * @dev Verify that address is signed with correct private key for
   * verification public key assigned to transfer.
   * @param _transitAddress transit address assigned to transfer
   * @param _recipient address Signed address.
   * @param _v ECDSA signature parameter v.
   * @param _r ECDSA signature parameters r.
   * @param _s ECDSA signature parameters s.
   * @return True if signature is correct.
   */
  function verifyTransferSignature(
				   address _transitAddress,
				   address _recipient,
				   uint8 _v,
				   bytes32 _r,
				   bytes32 _s)
    public pure returns(bool success)
  {
    return (verifySignature(_transitAddress,
			    _recipient, _v, _r, _s));
  }
}