contract c18808{
    /**
     * If we want to rebrand, we can.
     */
    function setName(string _name)
        onlyAdmin()
        public
    {
        name = _name;
    }
}