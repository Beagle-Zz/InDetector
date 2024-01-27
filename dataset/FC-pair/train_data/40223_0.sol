contract c40223{
     
    modifier noEther() {
        if (msg.value > 0) throw;
        _;
    }
}