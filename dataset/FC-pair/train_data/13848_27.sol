contract c13848{
    /**
     * @dev Function to set a new unlock date for partners' minting grants.
     *      Must be executed before the current unlock date, and the new
     *      date must be a later one. Up to one more week for security reasons.
     * @param date UNIX timestamp of the new unlock date for partners' grants.
     * @param extendLocking boolean value, true to extend the locking periods,
     *        false to leave the current dates.
     * @return True if the operation was successful.
     */
    function setGrantsUnlock(uint256 date, bool extendLocking) onlyOwner public returns (bool success) {
        require(now < grantsUnlock && date > grantsUnlock);
        if (extendLocking) {
          uint256 delay = date.sub(grantsUnlock);
          require(delay <= 604800);
          grantsUnlock = date;
          publicRelease = publicRelease.add(delay);
          partnersRelease = partnersRelease.add(delay);
          assert(publicRelease <= partnersRelease);
          assert(grantsUnlock < partnersRelease);
          UpdatedPublicReleaseDate(publicRelease);
          UpdatedPartnersReleaseDate(partnersRelease);
        }
        else {
          // Can set a date more than one week later, provided it is before the release date.
          grantsUnlock = date;
          assert(grantsUnlock < partnersRelease);
        }
        UpdatedGrantsLockDate(date);
        return true;
    }
}