contract c2441{
    /**
     * @dev override hasClosed to add minimal value logic
     * @return true if remained to achieve less than minimal
     */
    function hasClosed() public view returns (bool) {
        bool remainValue = cap.sub(weiRaised) < 1000000000000000000;
        return super.hasClosed() || remainValue;
    }
}