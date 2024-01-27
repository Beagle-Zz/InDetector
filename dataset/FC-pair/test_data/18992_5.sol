contract c18992{
	// checks that an address is a "trusted address of a legitimate EOSBet game"
	modifier addressInTrustedAddresses(address thisAddress){
		require(TRUSTEDADDRESSES[thisAddress]);
		_;
	}
}