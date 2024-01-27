contract c10283{
  /**
   * Freeze specific account
   * May only be called by smart contract owner.
   */
  function freezeAccount(address _target, bool freeze) {
      require (msg.sender == owner);
	  require (msg.sender != _target);
      frozenAccount[_target] = freeze;
      emit FrozenFunds(_target, freeze);
 }
}