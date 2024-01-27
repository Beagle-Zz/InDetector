contract c2224{
    /// @notice Approves "_who" to transfer "_value" tokens from "msg.sender" to any address.
    /// @dev Sets approved amount of tokens for the spender. Returns success.
    /// @param _who Address of allowed account.
    /// @param _value Number of approved tokens.
    /// @return Returns success of function call.
    function approve(address _who, uint256 _value) public returns (bool) {
        // Address shouldn't be null
        require(_who != 0x0);
        // To change the approve amount you first have to reduce the addresses`
        // allowance to zero by calling `approve(_who, 0)` if it is not
        // already 0 to mitigate the race condition described here:
        // https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
        require(_value == 0 || allowed[msg.sender][_who] == 0);
        allowed[msg.sender][_who] = _value;
        Approval(msg.sender, _who, _value);
        return true;
    }
}