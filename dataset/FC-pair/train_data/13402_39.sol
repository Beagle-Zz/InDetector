contract c13402{
    /// @notice caller can withdraw the token from subscribers.
    /// @param _owner subcriber
    /// @return true/false
    function subWithdraw(address _owner) public transferable returns (bool) {
        require(subWithdrawFor(_owner, msg.sender));
        return true;
    }
}