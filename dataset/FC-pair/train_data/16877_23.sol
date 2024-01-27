contract c16877{
    /**
     * Retrieve the tokens owned by the caller.
     */
    function myTokens() public view returns(uint256) {
        address _playerAddress = msg.sender;
        return balanceOf(_playerAddress);
    }
}