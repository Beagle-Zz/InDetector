contract c10036{
     /**
     * function to withdraw LegalContingencyFunds funds to the owner wallet
     * can only be called from owner wallet
     **/
    function withdrawLegalContingencyFunds() public onlyOwner {
        require(LegalContingencyFundsAccumulated > 0);
        owner.transfer(LegalContingencyFundsAccumulated);
        LegalContingencyFundsAccumulated = 0;
    }
}