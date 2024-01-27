contract c8293{
    // Pays [amount] of money to [to] account from epoch_fund
    // Counts amount +30% +10%
    // Updating _totalSupply
    // Pays to balance and 2 funds
    // Refreshes dec[]
    // Emits event
    function payout(address to, uint amount) private returns (bool success){
        require(to != address(0));
        require(amount>=current_mul());
        require(bitmask_check(to, 1024) == false); // banned == false
        require(frozen == false); 
        //Update account balance
        updateAccount(to);
        //fix amount
        uint fixedAmount = fix_amount(amount);
        renewDec( accounts[to].balance, accounts[to].balance.add(fixedAmount) );
        uint team_part = (fixedAmount/100)*10;
        uint dao_part = (fixedAmount/100)*30;
        uint total = fixedAmount.add(team_part).add(dao_part);
        epoch_fund = epoch_fund.sub(total);
        team_fund = team_fund.add(team_part);
        redenom_dao_fund = redenom_dao_fund.add(dao_part);
        accounts[to].balance = accounts[to].balance.add(fixedAmount);
        _totalSupply = _totalSupply.add(total);
        emit Transfer(address(0), to, fixedAmount);
        return true;
    }
}