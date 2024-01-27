contract c16361{
    /**
     * @dev Add a community grant for tokens that are locked until a predetermined time in the future
     * @param _receiver Grant receiver address
     * @param _amount Amount of tokens included in the grant
     */
    function addCommunityGrant(
        address _receiver,
        uint256 _amount
    )
        external
        onlyOwner
        atStage(Stages.GenesisStart)
    {
        uint256 updatedGrantsAmount = communityGrantsAmount.add(_amount);
        // Amount of tokens included in investor grants cannot exceed the community supply during genesis
        require(updatedGrantsAmount <= communitySupply);
        communityGrantsAmount = updatedGrantsAmount;
        // Receiver must not have already received a grant with timelocked tokens
        require(timeLockedHolders[_receiver] == address(0));
        // Create a timelocked holder contract to act as the holder of the grant's tokens
        TokenTimelock holder = new TokenTimelock(token, _receiver, grantsStartTimestamp);
        timeLockedHolders[_receiver] = holder;
        token.transfer(holder, _amount);
    }
}