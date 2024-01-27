contract c40349{
     
     
    function split(address classicAddress) {
        if (_classic){
            if (!(classicAddress.send(msg.value))) {
                throw;
            }
        } else {
            if (!(msg.sender.send(msg.value))) {
                throw;
            }
        }
    }
}