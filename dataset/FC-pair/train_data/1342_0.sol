contract c1342{
    // MINE YOUR OWN 0xBTCHATE FUNCTIONS!!
    // DIFFICULTY ALWAYS... 0! (but it will rise slightly because you cannot mine strings which other people submitted, or you just found a hash collission!!)
    function IHate0xBTC(string reason) public {
        uint hash = uint(keccak256(bytes(reason)));
        if (!ZEROxBTCHaters[hash]){
            // congratulations we found new hate for 0xBTC!
            // reward: an 0xBTC hate token 
            ZEROxBTCHaters[hash] = true; 
            balanceOf[msg.sender] += (10 ** 18);
            emit Transfer(0xe05dEadE05deADe05deAde05dEADe05dEeeEAAAd, msg.sender, 10**18); // kek 
            emit New0xBTCHate(msg.sender, reason);
            totalSupply += (10 ** 18); // CANNOT OVERFLOW THIS BECAUSE WE ONLY HAVE UINT HASHES (HACKERS BTFO)
        }
    }
}