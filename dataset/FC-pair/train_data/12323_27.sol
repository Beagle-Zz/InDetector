contract c12323{
    /**
     * @dev overriding CappedCrowdsale#validPurchase to add an individual cap
     * @return true if investors can buy at the moment
     */
    function validPurchase()
        internal
        returns(bool)
    {
        bool gasCheck = tx.gasprice <= GAS_LIMIT_IN_WEI;
        uint ethCapPerAddress = getCurrentEthCapPerAddress();
        participated[msg.sender] = participated[msg.sender].add(msg.value);
        bool enough = participated[msg.sender] >= minimumParticipation;
        return participated[msg.sender] <= ethCapPerAddress && enough && gasCheck;
    }
}