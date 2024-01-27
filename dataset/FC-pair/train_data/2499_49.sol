contract c2499{
    /**
     * @notice Overloaded version of the transfer function
     * @param _to receiver of transfer
     * @param _value value of transfer
     * @return bool success
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {
        adjustInvestorCount(msg.sender, _to, _value);
        require(verifyTransfer(msg.sender, _to, _value), "Transfer is not valid");
        adjustBalanceCheckpoints(msg.sender);
        adjustBalanceCheckpoints(_to);
        require(super.transfer(_to, _value));
        return true;
    }
}