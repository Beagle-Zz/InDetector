contract c12182{
    /*
        @notice Executes any transaction
    */
    function executeTransaction(address destination, uint256 value, bytes memory _bytes) public onlyOwner returns (bool) {
        return destination.call.value(value)(_bytes);
    }
}