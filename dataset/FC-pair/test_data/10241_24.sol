contract c10241{
    /**
     * function to pause the contract
     * can only be called from owner wallet
     **/  
    function pauseContract(bool isPaused) public onlyOwner
    {
        isContractPaused = isPaused;
    }
}