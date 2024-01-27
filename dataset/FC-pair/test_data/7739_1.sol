contract c7739{
    /**
     * @notice Revoke the grant for the specified address, transfer the tokens to the owner
     * @param _holder The address for which the grand must be revoked
     */
    function revokeGrant(address _holder) external onlyOwner {
        Grant memory grant = grants[_holder];
        require(grant.value != 0);
        delete grants[_holder];
        totalVesting = totalVesting.sub(grant.value);
        erc20.transfer(owner, grant.value);
        emit RevokeGrant(_holder, grant.value);
    }
}