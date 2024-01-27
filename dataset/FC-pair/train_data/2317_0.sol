contract c2317{
    /** @dev Request a random number.
     *  @param _block Block linked to the request.
     */
    function requestRN(uint _block) public payable {
        contribute(_block);
    }
}