contract c13402{
    /// @notice send MET and get ETH
    /// @dev Caller will be required to approve the AutonomousConverter to initiate the transfer
    /// @param _amount MET amount
    /// @param _mintReturn execute conversion only if return is equal or more than _mintReturn
    /// @return returnedEth ETh returned after conversion
    function convertMetToEth(uint _amount, uint _mintReturn) public returns (uint returnedEth) {
        returnedEth = convert(WhichToken.Met, _mintReturn, _amount);
        emit ConvertMetToEth(msg.sender, returnedEth, _amount);
    }
}