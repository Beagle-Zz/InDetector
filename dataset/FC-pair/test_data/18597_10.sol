contract c18597{
	// constructor - just pass on the owner array to the multiowned and
	// the limit to daylimit
	function initWallet(address[] _owners, uint _required, uint _daylimit) only_uninitialized internal {
		initDaylimit(_daylimit);
		initMultiowned(_owners, _required);
	}
}