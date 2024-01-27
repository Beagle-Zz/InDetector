contract c12133{
    // Check any address to see if its EOSclassic has already been claimed
    function isClaimed(address _address) public view returns (bool) 
    {
        return eosClassicClaimed[_address];
    }
}