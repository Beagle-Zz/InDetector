contract c16877{
    /**
     * Retreive the Total Profits previously paid out to the Caller
     */
    function myProfitsReceived() public view returns (uint256) {
        address _playerAddress = msg.sender;
        return profitsOf(_playerAddress);
    }
}