contract c2859{
	/**
	 * oraclize call back
	 * */
	function __callback(bytes32 myid, string result) public {
		uint gaslimit = gasleft();
		uint32 howmany;
		uint128 pot;
		uint gasCost;
		uint128 distpot;
		uint oraclizeFeeTmp = 0; // for event log
		if (msg.sender == oraclize_cbAddress() && myid == nextStealId) {
			howmany = numArtworks < 100 ? (numArtworks < 10 ? (numArtworks < 2 ? 0 : 1) : numArtworks / 10) : 10; //do not kill more than 10%, but at least one
			pot = removeArtworksByString(result,howmany);
			gasCost = ((oraclizeFee * etherExchangeLikeCoin) / 1 ether) * 1 ether + 1 ether/* not floor() */;
			if (pot > gasCost)
				distpot = uint128(pot - gasCost);
			distribute(distpot); //distribute the pot minus the oraclize gas costs
			oraclizeFeeTmp = oraclizeFee;
			oraclizeFee = 0;
		}
		emit newOraclizeCallback(myid,result,howmany,pot,distpot,oraclizeFeeTmp,gaslimit,etherExchangeLikeCoin);
	}
}