contract c2280{
    /**
    *@dev Sets the member types/permissions for those whitelisted
    *@param _memberTypes is the list of member types
    */
    function setWhitelistedMemberTypes(uint[] _memberTypes) public onlyOwner(){
        whitelistedTypes[0] = false;
        for(uint i = 0; i<_memberTypes.length;i++){
            whitelistedTypes[_memberTypes[i]] = true;
        }
    }
}