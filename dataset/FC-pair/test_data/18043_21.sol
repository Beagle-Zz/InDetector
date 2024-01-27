contract c18043{
    // Lock the DAICO supply until 2018-09-01 14:00:00
    // Which can then transferred to the created DAICO contract
    function transferDaico(address _to) public onlyOwner returns(bool) {
        require(now >= 1535810400);
        balances[vault] = balances[vault].sub(supplyDAICO);
        balances[_to] = balances[_to].add(supplyDAICO);
        emit Transfer(vault, _to, supplyDAICO);
        return(true);
    }
}