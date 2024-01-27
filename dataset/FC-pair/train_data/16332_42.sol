contract c16332{
   /**
   * @dev Modifier to make a function callable only when during Main-ICO.
   */
    modifier isMainICO() {
        require(main_sale);
        _;
    }
}