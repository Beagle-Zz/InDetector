contract c8363{
   /**
    * @dev Function to freeze Account
    * @param target The address that will freezed.
    * @param freeze Is it frozen.
    */
	function freezeAccount(address target, bool freeze) onlyOwner {
		frozenAccount[target]=freeze;
		emit FrozenFunds(target,freeze);
	}
}