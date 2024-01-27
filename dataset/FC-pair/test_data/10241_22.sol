contract c10241{
     /**
     * function to change the owner share on buying transactions
     * can only be called from owner wallet
     **/    
    function changeOwnerSharePerThousandForBuying(uint buyshare) public onlyOwner
    {
        ownerPerThousandShareForBuying = buyshare;
    }
}