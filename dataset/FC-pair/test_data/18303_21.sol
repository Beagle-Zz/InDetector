contract c18303{
    // Activate token sale function
    function activate() external onlyOwner {
        inActive = false;
    }
}