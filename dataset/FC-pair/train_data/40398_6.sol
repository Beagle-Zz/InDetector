contract c40398{
     
    function forceDivestOfOneInvestor(address currentInvestor)
        onlyOwner
        onlyIfStopped
        rejectValue {
        divest(currentInvestor);
         
        delete proposedWithdrawal;
    }
}