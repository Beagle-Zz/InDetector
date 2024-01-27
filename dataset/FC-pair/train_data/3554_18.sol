contract c3554{
    ///////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////
    // Withdraw amount from team_fund to given address
    function withdraw_team_fund(address to, uint amount) public onlyOwner returns(bool success){
        require(amount <= team_fund);
        accounts[to].balance = accounts[to].balance.add(amount);
        team_fund = team_fund.sub(amount);
        return true;
    }
}