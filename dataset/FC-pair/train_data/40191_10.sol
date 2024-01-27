contract c40191{
     
    function getChainySender(string code) constant returns (address) {
        return chainy[code].sender;
    }
}