contract c40466{
 
modifier expireGambles(){
    if (  (gambles.length!=0 && gambles.length-1>=firstActiveGamble ) 
          && gambles[firstActiveGamble].blockNumber + blockExpiration <= block.number && !gambles[firstActiveGamble].spinned )  
    { 
	solveBet(gambles[firstActiveGamble].player, 255, false, 0);
        updateFirstActiveGamble(firstActiveGamble);
    }
        _;
}
}