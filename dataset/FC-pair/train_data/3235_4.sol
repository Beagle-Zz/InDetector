contract c3235{
    /**
     * @dev players use this to change back to one of your old names.  tip, you'll
     * still need to push that info to existing games.
     * -functionhash- 0xb9291296
     * @param _nameString the name you want to use
     */
    function useMyOldName(string _nameString)
        isHuman()
        public
    {
        // filter name, and get pID
        bytes32 _name = _nameString.nameFilter();
        uint256 _pID = pIDxAddr_[msg.sender];
        // make sure they own the name
        require(plyrNames_[_pID][_name] == true, "umm... thats not a name you own");
        // update their current name
        plyr_[_pID].name = _name;
    }
}