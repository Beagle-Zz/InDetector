contract c16377{
    /** @dev by the address of client set performer for pending task */
    function findCliPendTAndSetPrfm(address _addr, address _performer) public returns(uint256) {
        uint256 l = countCliDreams(_addr);
        for(uint256 i=0; i<l; i++) {
            uint256 li = i + 1;
            if(DSData[_addr][li].hasPerformer == false) {
                DSData[_addr][li].hasPerformer = true;
                DSData[_addr][li].performer = _performer;
                uint256 pLen = countPerfClients(_performer);
                uint256 iLen = pLen + 1;
                DSDataP[_performer][iLen].client = _addr;
                DSDataP[_performer][iLen].client_id = li;
                DSDataP[_performer][iLen].isValid = true;
                return performerList.push(_addr);
            }
        }
    }
}