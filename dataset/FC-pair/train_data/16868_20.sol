contract c16868{
    /*----------  HELPERS AND CALCULATORS  ----------*/
    /**
     * Method to view the current Counter stored in the contract
     * Example: totalDestinationBalance()
     */
    function totalDestinationBalance()
        public
        view
        returns(uint256)
    {
        if(counter == 0x0){
            return address(this).balance;
        } else {
            return ERC20Interface(counter).balanceOf(this);
        }
    }
}