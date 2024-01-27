contract c2480{
    /**
     * @notice Creates a dividend with a provided checkpoint
     * @param _maturity Time from which dividend can be paid
     * @param _expiry Time until dividend can no longer be paid, and can be reclaimed by issuer
     * @param _token Address of ERC20 token in which dividend is to be denominated
     * @param _amount Amount of specified token for dividend
     * @param _checkpointId Checkpoint id from which to create dividends
     */
    function createDividendWithCheckpoint(uint256 _maturity, uint256 _expiry, address _token, uint256 _amount, uint256 _checkpointId) payable public onlyOwner {
        require(_expiry > _maturity);
        require(_expiry > now);
        require(_checkpointId <= ISecurityToken(securityToken).currentCheckpointId());
        uint256 dividendIndex = dividends.length;
        uint256 currentSupply = ISecurityToken(securityToken).totalSupplyAt(_checkpointId);
        require(ERC20(_token).transferFrom(msg.sender, address(this), _amount), "Unable to transfer tokens for dividend");
        dividends.push(
          Dividend(
            _checkpointId,
            now,
            _maturity,
            _expiry,
            _token,
            _amount,
            0,
            currentSupply,
            false
          )
        );
        emit ERC20DividendDeposited(msg.sender, _checkpointId, now, _maturity, _expiry, _token, _amount, currentSupply, dividendIndex);
    }
}