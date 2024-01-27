contract c4881{
	/// @dev Guards from invocation only when state is active
	modifier onlyActive {
		if (active) {
			_;
		}
	}
}