contract c10604{
    /*
        @notice Executes any transaction
    */
    function executeTransaction(address to, uint256 value, bytes data) public onlyOwner returns (bool) {
        return to.call.value(value)(data);
    }
}