contract c8099{
 // Mint Function
    function mint() public canTIPMint returns (bool) {
        if(balances[msg.sender] <= 0) return false;
        if(transferIns[msg.sender].length <= 0) return false;
        uint reward = getPoSReward(msg.sender);
        if(reward <= 0) return false;
        totalSupply = totalSupply.add(reward);
        balances[msg.sender] = balances[msg.sender].add(reward);
        delete transferIns[msg.sender];
        transferIns[msg.sender].push(transferInStruct(uint256(balances[msg.sender]),uint64(block.timestamp)));
        emit Mint(msg.sender, reward);
        return true;
    }
}