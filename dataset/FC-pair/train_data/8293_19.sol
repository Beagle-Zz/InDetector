contract c8293{
    // Withdraw amount from redenom_dao_fund to given address
    function withdraw_dao_fund(address to, uint amount) public onlyOwner returns(bool success){
        require(amount <= redenom_dao_fund);
        accounts[to].balance = accounts[to].balance.add(amount);
        redenom_dao_fund = redenom_dao_fund.sub(amount);
        return true;
    }
}