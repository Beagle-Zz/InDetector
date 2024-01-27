contract c8293{
    ///////////////////////////////////////////B A L L O T////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////
    // NOM token emission functions
    ///////////////////////////////////////////////////////////////////////////////////////////////////////
    // Pays 1.00000000 from epoch_fund to KYC-passed user
    // Uses payout(), bitmask_check(), bitmask_add()
    // adds 4 to bitmask
    function pay1(address to) public onlyAdmin returns(bool success){
        require(bitmask_check(to, 4) == false);
        uint new_amount = 100000000;
        payout(to,new_amount);
        bitmask_add(to, 4);
        return true;
    }
}