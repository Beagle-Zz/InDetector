contract c7739{
    /**
     * @notice Unlock the vested tokens, transferring them to their holder
     */
    function unlockGrant() external {
        Grant storage grant = grants[msg.sender];
        require(grant.value != 0);
        require(!grant.transferred);
        require(now >= grant.end); // solium-disable-line security/no-block-members
        grant.transferred = true;
        totalVesting = totalVesting.sub(grant.value);
        erc20.transfer(msg.sender, grant.value);
        emit UnlockGrant(msg.sender, grant.value);
    }
}