contract c3290{
    /// @dev Revoke the grant of tokens of a specifed address.
    /// @param _holder The address which will have its tokens revoked.
    function revoke(address _holder) public onlyOwner {
        Grant memory grant = grants[_holder];
        // Grant must be revokable.
        require(grant.revokable);
        // Calculate amount of remaining tokens that are still available to be
        // returned to owner.
        uint256 refund = grant.value.sub(grant.transferred);
        // Remove grant information.
        delete grants[_holder];
        // Update total vesting amount and transfer previously calculated tokens to owner.
        totalVesting = totalVesting.sub(refund);
        token.transfer(msg.sender, refund);
        GrantRevoked(_holder, refund);
    }
}