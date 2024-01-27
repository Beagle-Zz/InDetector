contract c16894{
  /**
 * Freeze funds on account
 * @param _target The account will be freezed
 * @param _funds The amount of funds will be freezed
 */
  function freezeAccount(address _target, uint256 _funds) public onlyOwner returns (bool) {
    frozen[_target] = _funds;
    Frozen(_target, _funds);
    return true;
  }
}