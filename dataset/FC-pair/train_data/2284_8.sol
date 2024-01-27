contract c2284{
    /**
    *@dev Gets membership type
    *@param _memberAddress address to view the membershipType
    */
    function getMembershipType(address _memberAddress) public constant returns(uint){
        return members[_memberAddress].membershipType;
    }
}