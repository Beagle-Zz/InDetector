contract c10096{
    /**
     * Returns asset balance for a particular holder.
     *
     * @param _owner holder address.
     *
     * @return holder balance.
     */
    function balanceOf(address _owner) constant returns(uint) {
        return etoken2.balanceOf(_owner, etoken2Symbol);
    }
}