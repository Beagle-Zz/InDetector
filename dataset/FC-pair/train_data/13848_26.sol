contract c13848{
    /**
     * @dev Set a new release date for partners' transfers.
     *      Must be executed before the current release date, and the new
     *      date must be a later one. Up to one more week for security reasons.
     * @param date UNIX timestamp of the new release date for partners' transfers.
     * @return True if the operation was successful.
     */
    function setPartnersRelease(uint256 date) onlyOwner public returns (bool success) {
        require(now < partnersRelease && date > partnersRelease);
        require(date.sub(partnersRelease) <= 604800);
        partnersRelease = date;
        assert(grantsUnlock < partnersRelease);
        UpdatedPartnersReleaseDate(date);
        return true;
    }
}