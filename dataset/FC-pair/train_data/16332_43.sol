contract c16332{
   /**
   * @dev called by the owner to initialize Main-ICO
   */
    function mainICO() public onlyOwner isPreICO {
        main_sale = true;
        emit MainICO();
    }
}