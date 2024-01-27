contract c7134{
    // called by the owner , resumes ICO
    function releaseICO() external onlyOwner
    {
        stopped = false;
    }
}