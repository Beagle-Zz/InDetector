contract c7465{
  /**
   * @dev is the signature of `this + sender` from a bouncer?
   * @return bool
   */
  function isValidSignature(address _address, bytes _sig)
    internal
    view
    returns (bool)
  {
    return isValidDataHash(
      keccak256(address(this), _address),
      _sig
    );
  }
}