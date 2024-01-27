contract c8293{
    // Pays .555666XX from epoch_fund to KYC user in new epoch;
    // Uses payout(), bitmask_check(), bitmask_add()
    // adds 2 to bitmask
    function pay055loyal(address to) public onlyAdmin returns(bool success){
        require(epoch > 1);
        require(bitmask_check(to, 4) == true);
        uint new_amount = 55566600 + (block.timestamp%100);       
        payout(to,new_amount);
        return true;
    }
}