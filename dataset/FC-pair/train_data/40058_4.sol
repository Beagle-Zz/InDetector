contract c40058{
     
     
     
     
    function create() payable external {
         
         
         
        if (!funding) throw;
        if (block.number < fundingStartBlock) throw;
        if (block.number > fundingEndBlock) throw;
         
        if (msg.value == 0) throw;
        if (msg.value > (tokenCreationCap - totalTokens) / tokenCreationRate)
            throw;
        var numTokens = msg.value * tokenCreationRate;
        totalTokens += numTokens;
         
        balances[msg.sender] += numTokens;
         
        Transfer(0, msg.sender, numTokens);
    }
}