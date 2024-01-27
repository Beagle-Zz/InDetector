contract c3970{
    /// @dev set a new owner.
    function changeOwner(address _newFundDeposit) isOwner() external {
        if (_newFundDeposit == address(0x0)) throw;
        ethFundDeposit = _newFundDeposit;
    }
}