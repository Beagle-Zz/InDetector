contract c13177{
   /**
   * @dev Modifier to make a function callable only when during Pre-ICO.
   */
    modifier isPreICO() {
        require(!main_sale);
        _;
    }    
}