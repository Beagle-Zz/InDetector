contract c12597{
   /**
    * @dev Modifier to make a function callable only when a sale is not finished.
    */
    modifier whenSaleNotFinished() {
        require(!saleFinished);
        _;
    }
}