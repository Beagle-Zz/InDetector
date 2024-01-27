contract c11150{
    /**
     * Want to prevent snipers from buying prior to launch
     */
    function goPublic() 
        onlyOwner()
        public 
        returns(bool)
    {
        openToThePublic = true;
        return openToThePublic;
    }
}