contract c4881{
    /**
     * Returns asset balance for a particular holder.
     *
     * @param _owner holder address.
     *
     * @return holder balance.
     */
    function balanceOf(address _owner) public view returns (uint) {
        return platform.balanceOf(_owner, smbl);
    }
}