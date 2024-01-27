contract c42{
	/* ItemAtIndex returns the item at index */
	function itemAtIndex (Data storage self, uint256 index) internal view returns(Element elem) {
		/* Can't access something outside of scope of array */
		assert(index < self.len);
		return self.array[index];
	}
}