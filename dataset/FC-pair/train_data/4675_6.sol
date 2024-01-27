contract c4675{
    /**
     * Returns asset allowance from one holder to another.
     *
     * @param _from holder that allowed spending.
     * @param _spender holder that is allowed to spend.
     *
     * @return holder to spender allowance.
     */
    function allowance(address _from, address _spender) constant returns(uint) {
        return etoken2.allowance(_from, _spender, etoken2Symbol);
    }
}