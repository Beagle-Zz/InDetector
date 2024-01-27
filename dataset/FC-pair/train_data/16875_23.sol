contract c16875{
    /**
     * Gets the Note for an Account Address
     */
    function getAccountCoords(address _playerAddress) public view returns (string) {
        return playerData_[_playerAddress].coords;
    }
}