contract c40553{
     
    function randomGen(uint seed, uint range) private constant returns (uint randomNumber) {
        return(uint(sha3(block.blockhash(block.number-1), seed))%range+1);
    }
}