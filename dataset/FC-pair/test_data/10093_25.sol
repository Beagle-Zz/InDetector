contract c10093{
    /**
     * Returns asset implementation contract address assigned to sender.
     *
     * @param _sender sender address.
     *
     * @return asset implementation contract address.
     */
    function getVersionFor(address _sender) constant returns(address) {
        return userOptOutVersion[_sender] == 0 ? latestVersion : userOptOutVersion[_sender];
    }
}