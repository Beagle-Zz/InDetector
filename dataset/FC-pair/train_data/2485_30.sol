contract c2485{
    /**
    * @notice adds or removes addresses from the whitelist.
    * @param _investor is the address to whitelist
    * @param _valid whether or not the address it to be added or removed from the whitelist
    */
    function modifyWhitelist(address _investor, bool _valid) public withPerm(WHITELIST) {
        whitelist[_investor] = _valid;
        emit LogModifyWhitelist(_investor, now, msg.sender, _valid);
    }
}