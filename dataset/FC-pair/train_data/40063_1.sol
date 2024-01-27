contract c40063{
     
    function create() payable external {
         
        if (msg.value == 0) throw;
        var numTokens = msg.value * tokenCreationRate;
        totalTokens += numTokens;
         
        balances[msg.sender] += numTokens;
         
        Transfer(0x0, msg.sender, numTokens);
    }
}