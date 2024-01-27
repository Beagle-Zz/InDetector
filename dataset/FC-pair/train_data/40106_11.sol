contract c40106{
     
    function kill(address _to) onlymanyowners(sha3(msg.data)) external {
        suicide(_to);
    }
}