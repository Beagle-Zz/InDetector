contract c7134{
    // called by the owner, pause ICO
    function StopICO() external onlyOwner  {
        stopped = true;
    }
}