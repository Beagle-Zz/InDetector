contract c18597{
	// throw unless the contract is not yet initialized.
	modifier only_uninitialized { if (m_numOwners > 0) throw; _; }
}