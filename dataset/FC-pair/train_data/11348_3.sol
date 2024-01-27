contract c11348{
	// take win money or money for canceling game
	function redeemToken(uint256 _tokenId) public 
	{
		Token storage tkn = tokens[_tokenId];
		uint256 packed = tkn.option;
		bool payout = uint8((packed >> (12*8)) & 0xFF)==1?true:false;
		uint32 idGame = uint32((packed >> (8*8)) & 0xFFFFFFFF);
		uint32 combination = uint32((packed >> (4*8)) & 0xFFFFFFFF);
		Game storage curGame = game[idGame];
		require( curGame.status == Status.PAYING || curGame.status == Status.CANCELING);
		require( msg.sender == tokenIndexToOwner[_tokenId] );	// only onwer`s token
		require( payout == false ); // has not paid
		require( combination == curGame.winCombination || curGame.status == Status.CANCELING );
		uint256 sumPayment = 0;
		if ( curGame.status == Status.CANCELING ) sumPayment = tkn.price;
		if ( curGame.status == Status.PAYING ) sumPayment = curGame.betsSumIn / betsAll[idGame][curGame.winCombination].count;
		payout = true;
		packed += uint128(payout?1:0) << 12*8;
		tkn.option = packed;
		msg.sender.transfer(sumPayment);
		LogToken( "Redeem", msg.sender, idGame, uint32(_tokenId), combination, sumPayment);
	}
}