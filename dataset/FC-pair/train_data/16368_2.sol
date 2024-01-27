contract c16368{
    /*
     * @dev Checks if a transcoding options string is valid
     * A transcoding options string is composed of video profile ids so its length
     * must be a multiple of VIDEO_PROFILE_SIZE
     * @param _transcodingOptions Transcoding options string
     */
    function validTranscodingOptions(string _transcodingOptions) public pure returns (bool) {
        uint256 transcodingOptionsLength = bytes(_transcodingOptions).length;
        return transcodingOptionsLength > 0 && transcodingOptionsLength % VIDEO_PROFILE_SIZE == 0;
    }
}