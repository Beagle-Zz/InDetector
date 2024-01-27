contract c10241{
    /**
     * function to delete a member from the list that could remove an animal from egg phase
     * can only be called from owner wallet
     **/  
    function deleteMember(address member) public onlyOwner 
    { 
        for (uint i=0;i<memberAddresses.length;i++)
        {
            if (memberAddresses[i]==member)
            {
                delete memberAddresses[i];
            }
        }
    }
}