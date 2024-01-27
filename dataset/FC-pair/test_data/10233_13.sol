contract c10233{
    /**
    * @dev The the game status.
    *
    * status = 0 buyable & sellable, user can buy or sell the token.
    * status=1 not buyable & not sellable, user cannot buy or sell the token.
    * @param _status The game status.
    */
    function changeStatus(uint8 _status) onlyOwner public {
        require(status != _status);
        status = _status;
        emit ChangeStatus(address(this), _status);
    }
}