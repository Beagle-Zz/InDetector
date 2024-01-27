contract c8311{
    /// @notice update current balance, if proper token amount approved
    function _depositEscrow(uint256 _amount) internal returns(bool) {
        currentBalance = currentBalance.add(_amount);
        return true;
    }
}