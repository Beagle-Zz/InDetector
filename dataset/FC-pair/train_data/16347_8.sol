contract c16347{
    /// @dev Retrieve the tokens owned by the caller.
    function myTokens() public view returns (uint) {
        address _customerAddress = msg.sender;
        return balanceOf(_customerAddress);
    }
}