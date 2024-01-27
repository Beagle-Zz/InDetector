contract c8441{
    // removing an address from the blacklist    
    function removeBlacklistAddress (address _address) public onlyOwner {
        blacklist[_address] = false;
    } 
}