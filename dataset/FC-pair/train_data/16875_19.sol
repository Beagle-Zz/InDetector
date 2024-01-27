contract c16875{
    /**
     * Gets the Nickname for an Account Address
     */
    function getAccountNickname(address _playerAddress) public view returns (string) {
        return playerData_[_playerAddress].name;
    }
}