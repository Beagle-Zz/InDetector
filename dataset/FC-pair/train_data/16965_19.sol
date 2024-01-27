contract c16965{
    /**
    * @notice Shows if crowdsale is running
    */ 
    function ironTokensaleRunning() view public returns(bool){
        return (!finalized && (tokensMinted < hardCap));
    }
}