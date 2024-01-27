contract c3030{
    /**
    * @dev check if address is member of Blocksquare
    * @param _member Address of member
    * @return True if member is member of Blocksquare, false instead
    **/
    function isBS(address _member) public constant returns (bool) {
        return memberOfBS[_member];
    }
}