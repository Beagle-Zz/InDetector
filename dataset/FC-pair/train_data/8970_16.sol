contract c8970{
    /// @notice request to receive bounty tokens
    /// @dev require State == Succes
    function requestBounty() external{
        require(releasedBountyTokens); //locked bounty hunter's token for 7 days after end of campaign
        require(getState()==State.Success);
        assert (bounties[msg.sender]>0);
        balanceOf[msg.sender] = safeAdd(balanceOf[msg.sender],bounties[msg.sender]);
        emit BountyTransfer(msg.sender,bounties[msg.sender],block.number);
        emit Transfer(0,msg.sender,bounties[msg.sender]);
        bounties[msg.sender] = 0;
    }
}