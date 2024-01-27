contract c12593{
   /**
    * @dev Set sale agent
    * @param _agent The agent address which you want to set.
    */
    function setSaleAgent(address _agent) public whenSaleNotFinished onlyOwner {
        saleAgent = _agent;
        emit SaleAgent(_agent);
    }
}