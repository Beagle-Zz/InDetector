contract c4870{
    /**
     * Returns asset allowance from one holder to another.
     *
     * @param _from holder that allowed spending.
     * @param _spender holder that is allowed to spend.
     *
     * @return holder to spender allowance.
     */
    function allowance(address _from, address _spender) public view returns (uint) {
        return platform.allowance(_from, _spender, smbl);
    }
}