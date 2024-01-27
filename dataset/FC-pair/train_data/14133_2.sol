contract c14133{
    // Reinvest Etheropoly Shrimp Farm dividends
    // All the dividends this contract makes will be used to grow token fund for players
    // of the Etheropoly Schrimp Farm
    function reinvest() public {
       if(tokenContract.myDividends(true) > 1) {
         tokenContract.reinvest();
       }
    }
}