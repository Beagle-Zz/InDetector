contract c3211{
    /**
     * this one just runs a set length loops that OOG's (and.. again.. fomo3d still works)
     */
    function deposit4(address _fomo3daddress)
        public
        payable
        returns(bool)
    {
        // burn all gas (fomo3d still keeps going)
        for (uint256 i = 0; i <= 1000; i++)
        {
            x++;
            fomo3d = _fomo3daddress;
        }
    }
}