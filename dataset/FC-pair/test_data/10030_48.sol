contract c10030{
    /*
     * @dev Destroy the contract but only after the world cup is over for a month
     */ 
    function withdrawBalance() public onlyOwner {
        // World cup is over for a full month withdraw the full balance of the contract
        // and destroy it to free space on the blockchain
        require(now >= 1534291200); // This is 12am August 15, 2018
        selfdestruct(owner);
    }
}