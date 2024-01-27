contract c13848{
    /**
     * @dev Set a new release date for investor's transfers.
     *      Must be executed before the current release date, and the new
     *      date must be a later one. Up to one more week for security reasons.
     * @param date UNIX timestamp of the new release date for investor's transfers.
     * @return True if the operation was successful.
     */
    function setPublicRelease(uint256 date) onlyOwner public returns (bool success) {
        require(now < publicRelease && date > publicRelease);
        require(date.sub(publicRelease) <= 604800);
        publicRelease = date;
        assert(publicRelease <= partnersRelease);
        UpdatedPublicReleaseDate(date);
        return true;
    }
}