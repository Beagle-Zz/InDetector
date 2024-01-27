contract c12593{
   /**
    * @dev Modifier to make a function callable only by owner or sale agent.
    */
    modifier onlyOwnerOrSaleAgent() {
        require(msg.sender == owner || msg.sender == saleAgent);
        _;
    }
}