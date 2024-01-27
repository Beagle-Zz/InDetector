contract c2482{
    /**
     * @notice Creates a dividend with a provided checkpoint
     * @param _maturity Time from which dividend can be paid
     * @param _expiry Time until dividend can no longer be paid, and can be reclaimed by issuer
     * @param _checkpointId Id of the checkpoint from which to issue dividend
     */
    function createDividendWithCheckpoint(uint256 _maturity, uint256 _expiry, uint256 _checkpointId) payable public onlyOwner {
        require(_expiry > _maturity);
        require(_expiry > now);
        require(msg.value > 0);
        require(_checkpointId <= ISecurityToken(securityToken).currentCheckpointId());
        uint256 dividendIndex = dividends.length;
        uint256 currentSupply = ISecurityToken(securityToken).totalSupplyAt(_checkpointId);
        dividends.push(
          Dividend(
            _checkpointId,
            now,
            _maturity,
            _expiry,
            msg.value,
            0,
            currentSupply,
            false
          )
        );
        emit EtherDividendDeposited(msg.sender, _checkpointId, now, _maturity, _expiry, msg.value, currentSupply, dividendIndex);
    }
}