contract c2775{
    /**
     * Allows for bonus drops of an address to be revoked by the owner of the contract. Any 
     * attempt made by any other account to invoke the function will result in a loss of gas
     * and the bonus drops of the recipient will remain untampered.
     * 
     * @param _addr The address to revoke bonus credits from.
     * @param _bonusDrops The amount of bonus drops to be revoked.
     * 
     * @return true if function executes successfully, false otherwise.
     * */
    function revokeBonusCreditOf(address _addr, uint256 _bonusDrops) public onlyOwner returns(bool) {
        require(
            _addr != address(0) 
            && bonusDropsOf[_addr] >= _bonusDrops
        );
        bonusDropsOf[_addr] = bonusDropsOf[_addr].sub(_bonusDrops);
        BonusCreditRevoked(_addr, _bonusDrops);
        return true;
    }
}