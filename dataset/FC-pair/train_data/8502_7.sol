contract c8502{
     /*======================================
     =          INTERNAL FUNCTIONS          =
     ======================================*/
     //pay winner
    function payWinner(address winner) internal
    {
        //need to have 0.05 ETH balance left over for the next round.
        uint balance = SafeMath.sub(address(this).balance, 50000000000000000);
        winner.transfer(balance);
        emit WinnerPaid(balance, winner);
    }
}