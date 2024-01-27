contract c2280{
    /**
    *@dev Checks the membership type/permissions for whitelisted members
    *@param _member address to get membership type from
    */
    function isWhitelisted(address _member) public view returns (bool){
        Membership_Interface Member = Membership_Interface(memberContract);
        return whitelistedTypes[Member.getMembershipType(_member)];
    }
}