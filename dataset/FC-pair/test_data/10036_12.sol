contract c10036{
    /**
     * function to withdraw LongTermFoundationBudget funds to the owner wallet
     * can only be called from owner wallet
     **/  
    function withdrawLongTermFoundationBudget() public onlyOwner {
        require(LongTermFoundationBudgetAccumulated > 0);
        owner.transfer(LongTermFoundationBudgetAccumulated);
        LongTermFoundationBudgetAccumulated = 0;
    }
}