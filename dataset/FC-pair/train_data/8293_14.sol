contract c8293{
    // Pays .555666XX from epoch_fund to user approved phone;
    // Uses payout(), bitmask_check(), bitmask_add()
    // adds 2 to bitmask
    function pay055(address to) public onlyAdmin returns(bool success){
        require(bitmask_check(to, 2) == false);
        uint new_amount = 55566600 + (block.timestamp%100);       
        payout(to,new_amount);
        bitmask_add(to, 2);
        return true;
    }
}