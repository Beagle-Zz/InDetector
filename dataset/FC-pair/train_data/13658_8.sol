contract c13658{
     /*======================================
     =          INTERNAL FUNCTIONS          =
     ======================================*/
     //pay winner
    function payWinner(address winner) internal
    {
        uint balance = address(this).balance;
        winner.transfer(balance);
        emit WinnerPaid(balance, winner);
    }
}