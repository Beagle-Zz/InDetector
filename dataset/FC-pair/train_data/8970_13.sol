contract c8970{
    /// @notice set token for bounty hunter to release when ICO success
    function addBounty(address _hunter, uint256 _amount) onlyOwner public{
        require(_hunter!=0x0);
        require(toWei(_amount)<=safeSub(bonusAndBountyTokens,toWei(_amount)));
        bounties[_hunter] = safeAdd(bounties[_hunter],toWei(_amount));
        bonusAndBountyTokens = safeSub(bonusAndBountyTokens,toWei(_amount));
        emit AddBounty(_hunter, toWei(_amount));
    }
}