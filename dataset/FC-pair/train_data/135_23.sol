contract c135{
    /// @dev Do we have a token address
    modifier tokenAvailable(){
        require(address(token) != 0,"Token address not set");
        _;
    }
}