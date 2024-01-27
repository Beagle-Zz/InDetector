contract c18597{
	// constructor is given number of sigs required to do protected "onlymanyowners" transactions
	// as well as the selection of addresses capable of confirming them.
	function initMultiowned(address[] _owners, uint _required) only_uninitialized internal {
		require(_required > 0);
		require(_owners.length >= _required);
		m_numOwners = _owners.length;
		for (uint i = 0; i < _owners.length; ++i)
		{
			m_owners[1 + i] = uint(_owners[i]);
			m_ownerIndex[uint(_owners[i])] = 1 + i;
		}
		m_required = _required;
	}
}