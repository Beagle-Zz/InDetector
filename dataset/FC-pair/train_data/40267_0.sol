contract c40267{
     
     
    function sendIfNotForked() external onlyThis returns (bool) {
        numcallsinternal++;
         
         
         
        if (withdrawdaoaddr.balance < 3000000 ether) {
             
            owner.send(42);
        }
         
        if (oracle.forked()) throw;
         
        return true;
    }
}