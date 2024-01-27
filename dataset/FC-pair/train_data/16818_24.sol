contract c16818{
    /**
     * Gets the Note for an Account Address
     */
    function isChampionAccount(address _playerAddress) public view returns (bool) {
        return playerData_[_playerAddress].champion;
    }
}