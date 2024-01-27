contract c2480{
    /**
     * @notice Creates a dividend and checkpoint for the dividend
     * @param _maturity Time from which dividend can be paid
     * @param _expiry Time until dividend can no longer be paid, and can be reclaimed by issuer
     * @param _token Address of ERC20 token in which dividend is to be denominated
     * @param _amount Amount of specified token for dividend
     */
    function createDividend(uint256 _maturity, uint256 _expiry, address _token, uint256 _amount) public onlyOwner {
        require(_expiry > _maturity);
        require(_expiry > now);
        require(_token != address(0));
        require(_amount > 0);
        require(ERC20(_token).transferFrom(msg.sender, address(this), _amount), "Unable to transfer tokens for dividend");
        uint256 dividendIndex = dividends.length;
        uint256 checkpointId = ISecurityToken(securityToken).createCheckpoint();
        uint256 currentSupply = ISecurityToken(securityToken).totalSupply();
        dividends.push(
          Dividend(
            checkpointId,
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
        emit ERC20DividendDeposited(msg.sender, checkpointId, now, _maturity, _expiry, _token, _amount, currentSupply, dividendIndex);
    }
}