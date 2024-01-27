contract c40407{
     
    function forceDivestOfOneInvestor(address currentInvestor)
        onlyOwner
        onlyIfStopped
        rejectValue {
        divest(currentInvestor);
         
        delete proposedWithdrawal;
    }
}