contract c11945{
    /**
     * @notice set address of a sale that will be next one after the current sale is finished
     * @param _sale address of the sale contract
     */
    function setNextSale(address _sale)
        external
        validAddress(_sale)
        onlymanyowners(keccak256(msg.data))
    {
        m_nextSale = _sale;
    }
}