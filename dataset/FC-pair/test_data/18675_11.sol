contract c18675{
    /*
     * @dev     Allows contract addresses to be changed in the event of 
     *          future contract upgrades.
     *
     * @param _LOT      Address of the LOT token contract
     * @param _ER       Address of the Etheraffle contract
     */
    function updateAddresses(address _LOT, address _ER) external onlyEtheraffle {
        LOTContract        = LOTInterface(_LOT);
        etheraffleContract = EtheraffleInterface(_ER);
    }
}