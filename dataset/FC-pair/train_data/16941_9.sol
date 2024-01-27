contract c16941{
//// Main contract callable functions
    function roll() external
            betsOver
            hasntRolled
            noEmergencyBlock
    {
        require(numberOfBets == (participants + extraBets));
        rolled = true;
        Proxy p = Proxy(proxy);
        p.sendToEtheroll.value((participants) * oneBet)(rollUnder, roundID);
	  }
}