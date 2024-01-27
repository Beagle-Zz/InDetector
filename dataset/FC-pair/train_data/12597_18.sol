contract c12597{
   /**
    * @dev Modifier to make a function callable only when a sale is finished.
    */
    modifier whenSaleFinished() {
        require(saleFinished || msg.sender == saleAgent || msg.sender == wallet );
        _;
    }
}