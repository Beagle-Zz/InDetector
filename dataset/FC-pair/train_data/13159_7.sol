contract c13159{
    //funtion to claim stake reward
    function mint() canPoSMint public returns (bool) {        
        if(balances[msg.sender] <= 0) return false;//no balance = no stake
        if(transferIns[msg.sender].length <= 0) return false;//no stake = no reward
        uint reward = getProofOfStakeReward(msg.sender);
        if(reward <= 0) return false;
        totalSupply = totalSupply.add(reward); //supply is increased
        balances[msg.sender] = balances[msg.sender].add(reward); //assigned to holder
        delete transferIns[msg.sender]; //stake stack get reset
        transferIns[msg.sender].push(transferInStruct(uint128(balances[msg.sender]),uint64(now)));
        //Logs
        emit Mint(msg.sender, reward);
        return true;
    }
}