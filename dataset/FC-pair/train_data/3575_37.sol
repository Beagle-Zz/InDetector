contract c3575{
    /**
     * @dev Internal funciton that helps to check if the pre-sale is active
     */
    function isPresaleActive() internal view returns (bool) {
        return now < presaleEndTime && now >= presaleStartTime;
    }
}