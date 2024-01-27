contract c7221{
  /**
   * @dev internal function to convert a hash to an eth signed message
   * @dev and then recover the signature and check it against the bouncer role
   * @return bool
   */
  function isValidDataHash(bytes32 hash, bytes _sig)
    internal
    view
    returns (bool)
  {
    address signer = hash
      .toEthSignedMessageHash()
      .recover(_sig);
    return hasRole(signer, ROLE_BOUNCER);
  }
}