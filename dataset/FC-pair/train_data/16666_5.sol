contract c16666{
   /**
    *   @dev Function to issues tokens for investors who made purchases in other cryptocurrencies
    *   @param _holder        address the tokens will be issued to
    *   @param _humanValue    number of Human tokens
    *   @param _txHash        transaction hash of investor's payment
    */
    function buyForInvestor(
        address _holder, 
        uint _humanValue, 
        string _txHash
    ) 
        external 
        onlyControllers {
        buy(_holder, _humanValue);
        LogBuyForInvestor(_holder, _humanValue, _txHash);
    }
}