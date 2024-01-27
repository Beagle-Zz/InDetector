contract c10241{
    /**
     * function to add a member that could remove animals from egg phase
     * can only be called from owner wallet
     **/  
    function addMember(address member) public onlyOwner 
    { 
        memberAddresses.push(member);
    }
}