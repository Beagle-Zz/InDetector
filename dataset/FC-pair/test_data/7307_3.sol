contract c7307{
    //Pay tournament winners
    function PayWinners(uint place, address winner) 
    public 
    isOpenToPublic()
    onlyRealPeople() 
    onlyOwner()
    {
        uint256 awardAmount = 0;
       if(place == 1)
       {
           awardAmount = firstPlacePot();
           BITcontract.transfer(winner, awardAmount);
       }
       else if(place == 2 )
       {
            awardAmount = secondPlacePot();
            BITcontract.transfer(winner, awardAmount);
       }
       else if(place ==3)
       {
            awardAmount = thirdPlacePot();
            BITcontract.transfer(winner, awardAmount);
       }
      emit WinnerPaid(awardAmount, winner);
    }
}