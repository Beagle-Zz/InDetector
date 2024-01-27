contract c4861{
	/// ServiceAllowance
    ///
    /// @notice ServiceAllowance interface implementation
    /// @dev Should cover conditions for allowance of transfers
    function isTransferAllowed(address, address _to, address, address _token, uint) onlyActive public view returns (bool) {
        if (_token == address(token) && _to == address(this)) {
            return true;
        }
    }
}