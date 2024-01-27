contract c7165{
	// Function Modifiers
	modifier beforeDeadline {
		require(now <= registrationDeadline);
		_;
	}
}