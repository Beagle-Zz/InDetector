contract c18718{
    /**
     * @dev override hasEnded to add minimal value logic
     * @return true if remained to achieve less than minimal
     */
    function hasEnded() public view returns (bool) {
        bool remainValue = cap.sub(weiRaised) < 100000000000000000;
        return super.hasEnded() || remainValue;
    }
}