contract c40466{
     
    modifier checkNbBetsCurrentBlock()
    {
        if (gambles.length!=0 && block.number==gambles[gambles.length-1].blockNumber) {nbBetsCurrentBlock+=1;}
        else nbBetsCurrentBlock=0;
        if (nbBetsCurrentBlock>=maxBetsPerBlock) throw;
        _;
    }
}