contract c2482{
    /**
     * @notice Creates a dividend and checkpoint for the dividend
     * @param _maturity Time from which dividend can be paid
     * @param _expiry Time until dividend can no longer be paid, and can be reclaimed by issuer
     */
    function createDividend(uint256 _maturity, uint256 _expiry) payable public onlyOwner {
        require(_expiry > _maturity);
        require(_expiry > now);
        require(msg.value > 0);
        uint256 dividendIndex = dividends.length;
        uint256 checkpointId = ISecurityToken(securityToken).createCheckpoint();
        uint256 currentSupply = ISecurityToken(securityToken).totalSupply();
        dividends.push(
          Dividend(
            checkpointId,
            now,
            _maturity,
            _expiry,
            msg.value,
            0,
            currentSupply,
            false
          )
        );
        emit EtherDividendDeposited(msg.sender, checkpointId, now, _maturity, _expiry, msg.value, currentSupply, dividendIndex);
    }
}