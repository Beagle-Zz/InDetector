contract c8715{
    /**
    * @dev Destroy tokens
    *
    * Remove `_value` tokens from the system irreversibly
    *
    * @param _value the amount of money to burn
    */
    function burn(uint256 _value)
    external
    returns(bool success) {
        _burn(msg.sender, _value);
        return true;
    }
}