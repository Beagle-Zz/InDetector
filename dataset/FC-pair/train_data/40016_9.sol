contract c40016{
     
     
     
     
    modifier onlyOwner() {
        if (msg.sender != owner) throw;
        _;
    }
}