contract c4861{
	/// @dev Guards from invocation only when state is active
	modifier onlyActive {
		if (active) {
			_;
		}
	}
}