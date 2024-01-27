contract c12593{
   /**
    * @dev Handle ICO end
    */
    function finishSale() public onlyOwnerOrSaleAgent {
        saleAgent = address(0);
        emit SaleAgent(saleAgent);
        saleFinished = true;
    }
}