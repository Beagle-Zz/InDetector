contract c2859{
	/************* HELPERS ****************/
	/**
	 * maps a given number to the new range (old range 100000)
	 * */
	function mapToNewRange(uint number, uint range, uint max) pure internal returns(uint16 randomNumber) {
		return uint16(number * range / max);
	}
}