contract c2723{
    /**
     * @dev receives entire player name list 
     */
    function receivePlayerNameList(uint256 _pID, bytes32 _name)
        external
    {
        require (msg.sender == address(UnicornBook), "only UnicornBook can call this function");
        if(plyrNames_[_pID][_name] == false)
            plyrNames_[_pID][_name] = true;
    }   
}