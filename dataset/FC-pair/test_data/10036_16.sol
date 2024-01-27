contract c10036{
     /**
     * function to withdraw OperationalExpenses funds to the owner wallet
     * can only be called from owner wallet
     **/
    function withdrawOperationalExpenses() public onlyOwner {
        require(OperationalExpensesAccumulated > 0);
        owner.transfer(OperationalExpensesAccumulated);
        OperationalExpensesAccumulated = 0;
    }
}