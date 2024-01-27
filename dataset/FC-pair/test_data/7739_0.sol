contract c7739{
    /**
     * @notice Grant tokens
     * @param _to The address to grant tokens to
     * @param _value The amount of tokens
     * @param _end The end of the vesting period (unix timestamp)
     */
    function createGrant(address _to, uint _value, uint _end) external onlyOwner {
        require(_to != address(0));
        require(_value > 0);
        // Check enough tokens available for this new grant
        require(totalVesting.add(_value) <= erc20.balanceOf(address(this)));
        // Only one grant per address
        require(grants[_to].value == 0);
        grants[_to] = Grant({
            value: _value,
            end: _end,
            transferred: false
        });
        totalVesting = totalVesting.add(_value);
        emit CreateGrant(_to, _value, _end);
    }
}