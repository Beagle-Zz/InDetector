contract c11989{
	// verifies that the gas price is lower than max gas price
	modifier validGasPrice() {
		assert(tx.gasprice <= maxGasPrice);
		_;
	}
}