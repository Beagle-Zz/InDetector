contract c2789{
    /**
     * @dev change owner.
     */
    function changeOwner(address newOwner)
        onlyOwner()
        public
    {
        owner = newOwner;
    }
}