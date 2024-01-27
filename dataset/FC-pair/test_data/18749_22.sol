contract c18749{
    // Transfer the balance between two accounts within the fund
    function fundTransferWithin(address _from, address _to, uint256 _amount) public {
        require(fundManagers[msg.sender]);
        require(_amount > 0);
        require(balances[msg.sender] >= _amount);
        require(fundBalances[msg.sender][_from] >= _amount);
        fundBalances[msg.sender][_from] = fundBalances[msg.sender][_from].sub(_amount);
        fundBalances[msg.sender][_to] = fundBalances[msg.sender][_to].add(_amount);
        if (fundBalances[msg.sender][_from] == 0){
            delete fundBalances[msg.sender][_from];
        }
        emit FundTransferWithin(msg.sender, _from, _to, _amount);
    }
}