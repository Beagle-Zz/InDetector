contract c3868{
    /**
    * @dev called by the owner to start the ICO
    */
    function startICO() external onlyOwner {
        icoStart = true;
    }
}