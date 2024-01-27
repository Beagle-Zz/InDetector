contract c2479{
    /**
     * @notice Overloaded version of the transferFrom function
     * @param _from sender of transfer
     * @param _to receiver of transfer
     * @param _value value of transfer
     * @return bool success
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        adjustInvestorCount(_from, _to, _value);
        require(verifyTransfer(_from, _to, _value), "Transfer is not valid");
        adjustBalanceCheckpoints(_from);
        adjustBalanceCheckpoints(_to);
        require(super.transferFrom(_from, _to, _value));
        return true;
    }
}