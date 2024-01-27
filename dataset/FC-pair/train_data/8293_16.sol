contract c8293{
    // Pays random number from epoch_fund
    // Uses payout()
    function payCustom(address to, uint amount) public onlyOwner returns(bool success){
        payout(to,amount);
        return true;
    }
}