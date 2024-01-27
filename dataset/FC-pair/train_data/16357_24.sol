contract c16357{
    /**
    * @dev compute & distribute the tokens
    */
    function distribute() public onlyOwner {
        // Initialisation check
        require(!initialDistributionDone);
        require(sale_address != 0x0 && team_address != 0x0 && advisors_address != 0x0 && security_address != 0x0 && press_address != 0x0 && user_acq_address != 0 && bounty_address != 0x0);      
        // Compute total supply 
        totalSupply_ = SALE.add(TEAM).add(ADVISORS).add(SECURITY).add(PRESS_MARKETING).add(USER_ACQUISITION).add(BOUNTY);
        // Distribute KRL Token 
        balances[owner] = totalSupply_;
        emit Transfer(0x0, owner, totalSupply_);
        transfer(team_address, TEAM);
        transfer(advisors_address, ADVISORS);
        transfer(security_address, SECURITY);
        transfer(press_address, PRESS_MARKETING);
        transfer(user_acq_address, USER_ACQUISITION);
        transfer(bounty_address, BOUNTY);
        transfer(sale_address, SALE);
        initialDistributionDone = true;
        whitelist(sale_address); // Auto whitelist sale address
        whitelist(team_address); // Auto whitelist team address (vesting transfert)
    }
}