contract c40224{
     
    modifier noEther() {
        if (msg.value > 0) throw;
        _;
    }
}