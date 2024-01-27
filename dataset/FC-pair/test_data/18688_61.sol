contract c18688{
    /**
     * @dev   Set the FreeLOT token contract address, in case of future updrades.
     *        Only allable by the Etheraffle address.
     *
     * @param _newAddr   New address of FreeLOT contract.
     */
    function setFreeLOT(address _newAddr) onlyEtheraffle external {
        freeLOT = FreeLOTInterface(_newAddr);
      }
}