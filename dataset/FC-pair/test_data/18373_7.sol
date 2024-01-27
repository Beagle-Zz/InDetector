contract c18373{
    /// @dev internal function
    function forwardFunds() internal {
        if (walletAddress != address(0)){
            walletAddress.transfer(msg.value);
        }
    }
}