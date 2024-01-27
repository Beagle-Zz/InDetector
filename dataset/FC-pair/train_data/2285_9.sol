contract c2285{
    /**
    *@dev Allows parties to see if one is blacklisted
    *@param _address the address of the party to blacklist
    *@return bool true for is blacklisted
    */
    function isBlacklist(address _address) public view returns(bool) {
        return blacklist[_address];
    }
}