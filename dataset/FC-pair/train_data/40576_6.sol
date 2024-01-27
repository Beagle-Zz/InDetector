contract c40576{
     
    function changeOwner(address newOwner) onlyowners {
        uint i = 0;
        while (i < 3) {
             
            if (msg.sender == owners[i]) {
                 
                owners[i] = newOwner;
            }
            i += 1;
        }
    }
}