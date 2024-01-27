contract c16388{
    /// @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
    /// @param _tokenspender The address which will spend the funds.
    /// @param _value The amount of tokens to be spent.
    function approve(address _tokenspender, uint256 _value) public whenNotPaused notFrozen returns (bool) {
        require(_tokenspender != address(0) && msg.sender != _tokenspender);
        require(!isFrozen(_tokenspender));
        /// To mitigate reentrancy race condition, set allowance for _tokenspender to 0
        /// first and then set the new value
        /// https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
        require((_value == 0) || (allowances[msg.sender][_tokenspender] == 0));
        /// Allow _tokenspender to transfer up to _value in tokens from msg.sender
        allowances[msg.sender][_tokenspender] = _value;
        /// Emit the Approval event
        emit Approval(msg.sender, _tokenspender, _value);
        return true;
    }
}