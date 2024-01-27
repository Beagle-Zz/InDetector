contract c8239{
    /**
     * @dev Allows the owner to change the token address.
     * @param _token New token address.
     */
    function changeToken(address _token) public
    onlyOwner {
        emit TokenChanged(address(token), _token);
        token = Token(_token);
    }
}