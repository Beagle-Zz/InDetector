contract c40030{
     
     
     
     
    modifier onlyOwner() {
        if (msg.sender != owner) throw;
        _;
    }
}