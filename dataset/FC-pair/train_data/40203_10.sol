contract c40203{
     
    function kill(address _to) onlymanyowners(sha3(msg.data, block.number)) external {
        suicide(_to);
    }
}