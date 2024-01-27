contract c18592{
    /// @dev internal function
    function forwardFunds() internal {
        if (walletAddress != address(0)){
            walletAddress.transfer(msg.value);
        }
    }
}