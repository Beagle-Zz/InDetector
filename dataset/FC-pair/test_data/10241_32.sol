contract c10241{
    /**
     * function to return the members that could remove an animal from egg phase
     **/  
    function listMembers() public constant returns (address[]) 
    { 
        return memberAddresses;
    }
}