contract c18675{
    /*
     * @dev     Returns current ticket price from the main Etheraffle
     *          contract
     */
    function getTktPrice() public view returns (uint) {
        return etheraffleContract.tktPrice();
    }
}