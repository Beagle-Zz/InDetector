contract c10241{
    /**
     * function to change the owner share on mating transactions
     * can only be called from owner wallet
     **/  
    function changeOwnerSharePerThousandForMating(uint mateshare) public onlyOwner
    {
        ownerPerThousandShareForMating = mateshare;
    }
}