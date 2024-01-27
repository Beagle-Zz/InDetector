contract c10036{
     /**
     * function to withdraw CashReserveFund funds to the owner wallet
     * can only be called from owner wallet
     **/
    function withdrawCashReserveFund() public onlyOwner {
        require(CashReserveFundAccumulated > 0);
        owner.transfer(CashReserveFundAccumulated);
        CashReserveFundAccumulated = 0;
    }
}