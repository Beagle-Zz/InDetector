contract c10241{
     /**
     * function to change the free animals limit for each user
     * can only be called from owner wallet
     **/ 
    function changeFreeAnimalsLimit(uint limit) public onlyOwner
    {
        freeAnimalsLimit = limit;
    }
}