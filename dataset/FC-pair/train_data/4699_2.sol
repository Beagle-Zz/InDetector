contract c4699{
    // New epoch can be started if:
    // - Current round is 9
    // - Curen epoch < 10
    function StartNewEpoch() public onlyAdmin returns(bool succ){
        require(frozen == false); 
        require(round == 9);
        require(epoch < 100);
        dec = [0,0,0,0,0,0,0,0];  
        round = 1;
        epoch++;
        epoch_fund = 100000 * 10**decimals; // 100 000.00000000, 100 Kt
        total_fund = total_fund.sub(epoch_fund); // Taking 100 Kt from total to epoch fund
        emit Epoch(epoch);
        return true;
    }
}