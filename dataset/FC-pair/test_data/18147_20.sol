contract c18147{
    /**
     * @dev Approve the passed address to spend tokens on behalf of msg.sender.
     *
     * This function is more authorizeOperator and revokeOperator from ERC777 that Approve from ERC20.
     * Approve concept has several issues (e.g. https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729),
     * so I prefer to use operator concept. If you want to revoke approval, just put 0 into _value.
     * @param _spender The address which will spend the funds.
     * @param _value Fake value to be compatible with ERC20 requirements.
     */
    function approve(address _spender, uint256 _value) public returns (bool) {
        require(_spender != msg.sender);
        if (_value > 0) {
            // Authorizing operator
            isOperatorFor[_spender][msg.sender] = true;
            emit AuthorizedOperator(_spender, msg.sender);
        } else {
            // Revoking operator
            isOperatorFor[_spender][msg.sender] = false;
            emit RevokedOperator(_spender, msg.sender);
        }
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
}