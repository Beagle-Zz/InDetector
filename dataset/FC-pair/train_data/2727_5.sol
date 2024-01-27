contract c2727{
    // Function to pull out the house cut to the bankroll if required (i.e. to seed other games).
    function retrieveHouseTake() public onlyOwnerOrBankroll {
        uint toTake = houseTake;
        houseTake = 0;
        contractBalance = contractBalance.sub(toTake);
        ZTHTKN.transfer(bankroll, toTake);
        emit HouseRetrievedTake(now, toTake);
    }
}